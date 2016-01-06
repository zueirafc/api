FactoryGirl.define do
  factory :medium do
    file { Forgery('name').company_name }
    kind { MediumKind.list.sample }

    association :micropost, factory: :micropost
  end

  factory :invalid_medium, parent: :medium do
    file nil
    kind nil

    micropost nil
  end
end
