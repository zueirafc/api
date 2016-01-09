require 'rails_helper'

RSpec.describe Target, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:micropost) }
    it { is_expected.to belong_to(:targetable) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:micropost) }
    it { is_expected.to validate_presence_of(:targetable) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:micropost_id).of_type(:integer) }
    it { is_expected.to have_db_column(:targetable_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:micropost_id) }
    it { is_expected.to have_db_index([:targetable_type, :targetable_id]) }
  end

  context 'factories' do
    it { expect(build(:target, :with_club)).to be_valid }
    it { expect(build(:invalid_target)).to_not be_valid }
  end
end
