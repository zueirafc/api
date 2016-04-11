module Searches
  class TwitterUserService
    class << self
      def find_tweets_for(source)
        last = source.last.try(&:provider_id)
        params = "from:#{source.key} -rt"

        TwitterProvider.client.search(params).take(100).each do |tweet|
          break if reached_limit? tweet.id, last

          begin
            make_a_item_using!(tweet, source)
          rescue => e
            Rails.logger.info "--- ERROR at #{self}: #{e.message} ---\n"
          end
        end
      end

      private

      def reached_limit?(id, last)
        id.to_s.eql?(last)
      end

      def make_a_item_using!(tweet, source)
        ActiveRecord::Base.transaction do
          post = Micropost.create provider_id: tweet.id,
                                  text: tweet.text,
                                  source: source,
                                  status: MicropostStatus::PENDING

          attach_clubs_to post, from: source
          attach_content_to post, from: tweet
        end
      end

      def attach_content_to(post, from:)
        from.media.each do |item|
          Medium.create do |m|
            m.micropost = post
            m.remote_file_url = item.media_url_https.to_s
          end
        end
      end

      def attach_clubs_to(post, from:)
        post.trollers << Troller.new(trollerable: from.troller)
        post.targets << Target.new(targetable: from.target)
      end
    end
  end
end
