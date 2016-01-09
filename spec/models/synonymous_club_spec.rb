require 'rails_helper'

RSpec.describe SynonymousClub, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:club) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:club) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }

    it { is_expected.to have_db_column(:club_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:club_id) }
  end

  context 'factories' do
    it { expect(build(:synonymous_club)).to be_valid }
    it { expect(build(:invalid_synonymous_club)).to_not be_valid }
  end
end
