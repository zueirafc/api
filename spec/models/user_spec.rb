require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:club) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:club) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:username).of_type(:string) }
    it { is_expected.to have_db_column(:image).of_type(:string) }
    it { is_expected.to have_db_column(:emal).of_type(:string) }
    it { is_expected.to have_db_column(:password).of_type(:string) }

    it { is_expected.to have_db_column(:club_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:email) }
    it { is_expected.to have_db_index(:username) }
    it { is_expected.to have_db_index(:club_id) }
  end

  context 'factories' do
    it { expect(build(:user)).to be_valid }
    it { expect(build(:invalid_user)).to_not be_valid }
  end
end
