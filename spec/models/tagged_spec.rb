require 'rails_helper'

RSpec.describe Tagged, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:tag) }
    it { is_expected.to belong_to(:micropost) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:tag) }
    it { is_expected.to validate_presence_of(:micropost) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:tag_id).of_type(:integer) }
    it { is_expected.to have_db_column(:micropost_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:tag_id) }
    it { is_expected.to have_db_index(:micropost_id) }
  end

  context 'factories' do
    it { expect(build(:relationship)).to be_valid }
    it { expect(build(:invalid_relationship)).to_not be_valid }
  end
end
