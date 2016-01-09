module Searches
  class TwitterHashtagService
    class << self
      def find_tweets_for(event, client = $twitter_client)
        last = event.tweets.last.try(&:id)

        client.search("#{event.tag} -rt", result_type: :recent)
          .each_with_index do |tweet, i|
          break if tweet.id.to_s.eql?(last) || i.eql?(100)

          begin
            ActiveRecord::Base.transaction do
              event.items << make_a_item_by(tweet)
            end
          rescue => e
            Rails.logger.info "----- ERROR at twitter: #{e.message} -----\n"
          end
        end
      end

      def make_a_item_by(tweet)
        return unless tweet

        # item = Item.new(id: tweet.id,
        #                 text: tweet.text,
        #                 status: ItemStatus::LISTED,
        #                 author: make_an_author_by(tweet.user),
        #                 service: ServiceKind::TWITTER)

        item.remote_image_url =
          tweet.media[0].media_url_https if tweet.media.present?

        item
      end
    end
  end
end
