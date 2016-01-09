require 'rails_helper'

RSpec.describe Medium, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:micropost) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:micropost) }

    it :kind do
      is_expected.to validate_presence_of(:kind)
      is_expected.to validate_inclusion_of(:kind).in_array(MediumKind.list)
    end
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:micropost_id).of_type(:integer) }
    it { is_expected.to have_db_column(:file).of_type(:string) }
    it { is_expected.to have_db_column(:kind).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:micropost_id) }
  end

  context 'factories' do
    it { expect(build(:medium)).to be_valid }
    it { expect(build(:invalid_medium)).to_not be_valid }
  end
end
