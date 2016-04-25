FactoryGirl.define do
  factory :nickname_fan do
    name { Forgery('name').male_first_name }
    plural { name.pluralize }

    status { CommonStatus.list.sample }

    club
  end

  factory :invalid_nickname_fan, parent: :nickname_fan do
    name nil
    plural nil

    status nil

    club nil
  end
end
