require 'rails_helper'

RSpec.describe LeagueParticipant, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:club) }
    it { is_expected.to belong_to(:edition) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:edition) }
    it { is_expected.to validate_presence_of(:club) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:club_id).of_type(:integer) }
    it { is_expected.to have_db_column(:edition_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:club_id) }
    it { is_expected.to have_db_index(:edition_id) }
  end

  context 'factories' do
    it { expect(build(:league_participant)).to be_valid }
    it { expect(build(:invalid_league_participant)).to_not be_valid }
  end
end
