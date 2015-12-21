FactoryGirl.define do
  factory :club, class: 'Club' do
    shield { Forgery('lorem_ipsum').words(2) }
    official_website { Forgery('internet').domain_name }
    official_facebook_page { Forgery('internet').domain_name }
    official_twitter_page { Forgery('internet').domain_name }
    short_name { Forgery('lorem_ipsum').words(2) }
    full_name { Forgery('lorem_ipsum').words(2) }
    initials { Forgery('lorem_ipsum').words(1) }
  end

  factory :invalid_club, parent: :club do
    shield nil
    official_website nil
    official_facebook_page nil
    official_twitter_page nil
    short_name nil
    full_name nil
    initials nil
  end
end
