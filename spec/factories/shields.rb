FactoryGirl.define do
  factory :club do
    shield { Forgery('lorem_ipsum').words(2) }
    official_website { Forgery('internet').address }
    official_facebook_page { Forgery('internet').address }
    official_twitter_page { Forgery('internet').address }
    short_name { Forgery('lorem_ipsum').words(2) }
    full_name { Forgery('lorem_ipsum').words(2) }
    initials { Forgery('lorem_ipsum').words(1) }
  end

  factory :invalid_club do
    shield nil
    official_website nil
    official_facebook_page nil
    official_twitter_page nil
    short_name nil
    full_name nil
    initials nil
  end
end
