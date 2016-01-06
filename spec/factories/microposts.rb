FactoryGirl.define do
  factory :micropost do
    text { Forgery('lorem_ipsum').text }
    all_targets { Forgery('basic').boolean }
    all_trollers { Forgery('basic').boolean }
    is_shared { Forgery('basic').boolean }
    shared { Forgery('basic').number }

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

    status nil

    user nil
  end
end
