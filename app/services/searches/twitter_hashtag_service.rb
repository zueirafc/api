module Searches
  class TwitterHashtagService
    class << self
      def find_tweets_for(source)
        last = source.last.try(&:id)
        params = "#{source.key} -rt"

        TwitterProvider.client.search(params).each_with_index do |tweet, i|
          break if reached_limit? tweet.id, last, i

          begin
            make_a_item_using!(tweet, source)
          rescue => e
            Rails.logger.info "--- ERROR at #{self.class}: #{e.message} ---\n"
          end
        end
      end

      private

      def reached_limit?(id, last, index)
        id.to_s.eql?(last) || index.eql?(100)
      end

      def make_a_item_using!(tweet, source)
        return unless tweet

        ActiveRecord::Base.transaction do
          post = Micropost.create provider_id: tweet.id,
                                  text: tweet.text,
                                  source: source,
                                  status: MicropostStatus::PENDING

          attach_content_to post, from: tweet
        end
      end

      def attach_content_to(post, from:)
        from.media.each do |item|
          medium = Medium.new micropost: post
          medium.remote_file_url = item.media_url_https
        end
      end
    end
  end
end
