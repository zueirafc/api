FactoryGirl.define do
  factory :contact_category do
    name { Forgery('name').company_name }
    email { Forgery('internet').email_address }

    status { CommonStatus.list.sample }
  end

  factory :invalid_contact_category, parent: :contact_category do
    name nil
    email nil

    status nil
  end
end
