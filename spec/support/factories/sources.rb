FactoryGirl.define do
  factory :source do
    name { Forgery('name').company_name }
    root_url { rand(999999) }
    key { Forgery('internet').domain_name }

    kind { SourceKind.list.sample }
    status { CommonStatus.list.sample }

    association :club, factory: :club

    trait :active do
      status { CommonStatus::ACTIVE }
    end
  end

  factory :invalid_source, parent: :source do
    name nil
    root_url nil
    key nil

    kind nil
    status nil

    club nil
  end
end
