require 'rails_helper'

RSpec.describe Micropost, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:text) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:text).of_type(:text) }

    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:user_id) }
  end

  context 'factories' do
    it { expect(build(:micropost)).to be_valid }
    it { expect(build(:invalid_micropost)).to_not be_valid }
  end
end
