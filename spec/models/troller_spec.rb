require 'rails_helper'

RSpec.describe Troller, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:micropost) }
    it { is_expected.to belong_to(:trollerable) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:micropost) }
    it { is_expected.to validate_presence_of(:trollerable) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:micropost_id).of_type(:integer) }
    it { is_expected.to have_db_column(:trollerable_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:micropost_id) }
    it { is_expected.to have_db_index([:trollerable_type, :trollerable_id]) }
  end

  context 'factories' do
    it { expect(build(:troller, :with_club)).to be_valid }
    it { expect(build(:invalid_troller)).to_not be_valid }
  end
end
