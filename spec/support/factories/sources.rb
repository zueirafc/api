FactoryGirl.define do
  factory :source do
    name { Forgery('name').company_name }
    root_url { rand(999_999) }
    key { Forgery('internet').domain_name }

    kind { SourceKind.list.sample }
    status { CommonStatus.list.sample }

    troller { build(:club) }
    target nil

    trait :active do
      status { CommonStatus::ACTIVE }
    end

    trait :targets do
      target { build(:club) }
    end
  end

  factory :invalid_source, parent: :source do
    name nil
    root_url nil
    key nil

    kind nil
    status nil

    troller nil
    target nil
  end
end
