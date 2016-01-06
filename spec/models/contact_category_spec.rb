require 'rails_helper'

RSpec.describe ContactCategory, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:contacts) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:name) }

    it do
      is_expected.to validate_presence_of(:status)
      is_expected.to validate_inclusion_of(:status).in_array(CommonStatus.list)
    end
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:status) }
  end

  context 'factories' do
    it { expect(build(:contact_category)).to be_valid }
    it { expect(build(:invalid_contact_category)).to_not be_valid }
  end
end
