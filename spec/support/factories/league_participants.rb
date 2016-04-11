FactoryGirl.define do
  factory :league_participant do
    edition { build(:league_edition) }
    club { build(:club) }
  end

  factory :invalid_league_participant, parent: :league_participant do
    edition nil
    club nil
  end
end
