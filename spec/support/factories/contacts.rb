FactoryGirl.define do
  factory :contact do
    email { Forgery('internet').email_address }
    name { Forgery('name').full_name }
    message { Forgery('lorem_ipsum').text }

    status { ContactStatus.list.sample }

    association :category, factory: :contact_category
  end

  factory :invalid_contact, parent: :contact do
    email nil
    name nil
    message nil

    status nil

    category nil
  end
end
