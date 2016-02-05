module Searches
  class BaseService
    attr_reader :source

    def initialize(source)
      @source = source
    end

    def start_finder!
      send("find_by_#{SourceKind.key_for(source.kind)}!")
    end

    def find_by_atom_feed!
      AtomFeedService.find_microposts_by source
    end

    def find_by_facebook_page!
      FacebookPageService.find_posts_for source
    end

    def find_by_rss_feed!
      RSSFeedService.find_microposts_by source
    end

    def find_by_twitter_user!
      TwitterUserService.find_tweets_for source
    end

    def find_by_twitter_hashtag!
      TwitterHashtagService.find_tweets_for source
    end
  end
end
