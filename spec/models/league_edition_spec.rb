require 'rails_helper'

RSpec.describe LeagueEdition, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:league) }
    it { is_expected.to belong_to(:champion) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:edition_at) }
    it { is_expected.to validate_presence_of(:league) }

    it :status do
      should validate_presence_of(:status)
      should validate_inclusion_of(:status).in_array(LeagueEditionStatus.list)
    end
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:league_id).of_type(:integer) }
    it { is_expected.to have_db_column(:edition_at).of_type(:date) }
    it { is_expected.to have_db_column(:champion_id).of_type(:integer) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:league_id) }
    it { is_expected.to have_db_index(:champion_id) }
  end

  context 'factories' do
    it { expect(build(:league_edition)).to be_valid }
    it { expect(build(:invalid_league_edition)).to_not be_valid }
  end
end
