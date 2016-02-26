FactoryGirl.define do
  factory :league_participant do
    association :edition, factory: :league_edition
    association :club, factory: :club
  end

  factory :invalid_league_participant, parent: :league_participant do
    edition nil
    club nil
  end
end
