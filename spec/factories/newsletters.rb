FactoryGirl.define do
  factory :newsletter do
    email { Forgery('internet').email_address }
    is_accepted_partner {Forgery('basic').boolean}

    status { CommonStatus.list.sample }
  end

  factory :invalid_newsletter, parent: :newsletter do
    email nil
    is_accepted_partner nil

    status nil
  end
end
