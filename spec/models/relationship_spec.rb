require 'rails_helper'

RSpec.describe Relationship, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:followed).class_name('User') }
    it { is_expected.to belong_to(:follower).class_name('User') }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:followed) }
    it { is_expected.to validate_presence_of(:follower) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:followed_id).of_type(:integer) }
    it { is_expected.to have_db_column(:follower_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:followed_id) }
    it { is_expected.to have_db_index(:follower_id) }
  end

  context 'factories' do
    it { expect(build(:relationship)).to be_valid }
    it { expect(build(:invalid_relationship)).to_not be_valid }
  end
end
