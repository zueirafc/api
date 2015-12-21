require 'rails_helper'

RSpec.describe PostReference, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:micropost) }
    it { is_expected.to belong_to(:user) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:micropost) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:micropost_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(:micropost_id) }
  end

  context 'factories' do
    it { expect(build(:post)).to be_valid }
    it { expect(build(:invalid_post)).to_not be_valid }
  end
end
