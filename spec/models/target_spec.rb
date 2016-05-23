require 'rails_helper'

RSpec.describe Target, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:micropost) }
    it { is_expected.to belong_to(:targetable) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:micropost) }
    it { is_expected.to validate_presence_of(:targetable) }

    it 'multiple targets in the same micropost' do
      club = create :club
      post = create :micropost

      create :target, targetable: club, micropost: post
      expect do
        create :target, targetable: club, micropost: post
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:micropost_id).of_type(:integer) }
    it { is_expected.to have_db_column(:targetable_id).of_type(:integer) }
    it { is_expected.to have_db_column(:targetable_type).of_type(:string) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:micropost_id) }
    it { is_expected.to have_db_index([:targetable_type, :targetable_id]) }
  end

  context 'factories' do
    it { expect(build(:target, :with_club)).to be_valid }
    it { expect(build(:invalid_target)).to_not be_valid }
  end

  context 'class methods' do
    describe '.valid_ones' do
      before do
        editions = create_list :league_edition, 2
        clubs = create_list :club, 2
        create :league_participant, club: clubs.first, edition: editions.first
        create :league_participant, club: clubs.last, edition: editions.last
      end

      it 'return clubs and leagues' do
        result = { clubs: Club.all, leagues: LeagueEdition.all }

        expect(described_class.valid_ones).to eq(result)
      end
    end
  end
end
