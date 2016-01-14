module Searches
  class RSSFeedService
    class << self
      def find_microposts_by(source)
        last = source.last.try(&:provider_id).to_s

        Feedjira::Feed.fetch_and_parse(source.key).entries.each do |feed|
          break if reached_limit? feed.entry_id, last

          begin
            create_micropost_using!(feed, source)
          rescue => e
            Rails.logger.info "--- ERROR at #{self}: #{e.message} ---\n"
          end
        end
      end

      private

      def reached_limit?(id, last)
        id.to_s.eql?(last)
      end

      def create_micropost_using!(feed, source)
        pure_text = Nokogiri::HTML(feed.content).xpath('//text()').to_s

        ActiveRecord::Base.transaction do
          post = Micropost.create provider_id: feed.entry_id,
                                  text: pure_text,
                                  title: feed.title,
                                  source: source,
                                  status: MicropostStatus::PENDING

          attach_troller_to post, from: source
          attach_content_to post, from: feed
        end
      end

      def attach_content_to(post, from:)
        images = Nokogiri::HTML(from.content).css('img')

        images.each do |item|
          Medium.create do |m|
            m.micropost = post
            m.remote_file_url = item.attributes['src'].value
          end
        end
      end

      def attach_troller_to(post, from:)
        post.trollers << Troller.new(trollerable: from.club)
      end
    end
  end
end
