class SourceKind < EnumerateIt::Base
  associate_values facebook_page: 1, twitter_user: 2, atom_feed: 3, rss_feed: 4,
                   instagram_user: 5, twitter_hashtag: 6
end
