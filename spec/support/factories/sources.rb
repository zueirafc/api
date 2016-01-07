FactoryGirl.define do
  factory :source do
    name { Forgery('name').company_name }
    key { Forgery('internet').domain_name }

    kind { SourceKind.list.sample }
    status { CommonStatus.list.sample }

    association :club, factory: :club
  end

  factory :invalid_source, parent: :source do
    name nil
    key nil

    kind nil
    status nil

    club nil
  end
end
