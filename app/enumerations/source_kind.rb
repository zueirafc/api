class SourceKind < EnumerateIt::Base
  associate_values facebook_page: 1, twitter_user: 2, atom_feed: 3, rss_feed: 4,
                   twitter_hashtag: 5
end
