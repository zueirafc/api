FactoryGirl.define do
  factory :newsletter do
    email 'MyString'
    is_accepted_partner false
    status 1
  end
end
