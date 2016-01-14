FactoryGirl.define do
  factory :micropost do
    text { Forgery('lorem_ipsum').text }
    all_targets { Forgery('basic').boolean }
    all_trollers { Forgery('basic').boolean }
    is_shared { Forgery('basic').boolean }
    shared { Forgery('basic').number }
    provider_id { Forgery('basic').password }
    provider_url { Forgery('internet').domain_name }

    status { MicropostStatus.list.sample }

    association :user, factory: :user
    association :source, factory: :source
  end

  factory :invalid_micropost, parent: :micropost do
    text nil
    all_targets nil
    all_trollers nil
    is_shared nil
    shared nil
    provider_id nil
    provider_url nil

    status nil

    user nil
  end
end
