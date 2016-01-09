module Searches
  class Base
    def initialize(event)
      @event = event
    end

    def start_finder!
      @event.services.map(&:to_i).each do |key|
        send("find_with_#{ServiceKind.key_for(key)}!")
      end
    end

    def find_with_twitter!
      TwitterService.find_tweets_for(@event)
    end

    def find_with_instagram!
      InstagramService.find_media_items_for(@event)
    end
  end
end
