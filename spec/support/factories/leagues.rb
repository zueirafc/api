FactoryGirl.define do
  factory :league do
    name { Forgery('name').full_name }
    country { Forgery('address').country }
    codename { Forgery('name').full_name }

    status { CommonStatus.list.sample }
  end

  factory :invalid_league, parent: :league do
    name nil
    country nil
    codename nil

    status nil
  end
end
