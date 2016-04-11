FactoryGirl.define do
  factory :tagged do
    micropost { build(:micropost) }
    synonymous_club { build(:synonymous_club) }
  end

  factory :invalid_tagged, parent: :tagged do
    micropost nil
    synonymous_club nil
  end
end
