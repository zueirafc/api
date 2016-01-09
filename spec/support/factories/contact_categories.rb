FactoryGirl.define do
  factory :contact_category do
    name { Forgery('name').company_name }

    status { CommonStatus.list.sample }
  end

  factory :invalid_contact_category, parent: :contact_category do
    name nil

    status nil
  end
end
