FactoryGirl.define do
  factory :league_edition do
    edition_at { Forgery('date').date }

    status { LeagueEditionStatus.list.sample }

    association :league, factory: :league
    association :champion, factory: :club
  end

  factory :invalid_league_edition, parent: :league_edition do
    edition_at nil

    status nil

    league nil
    champion nil
  end
end
