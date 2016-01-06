require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:category) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:category) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:message) }

    it do
      is_expected.to validate_presence_of(:status)
      is_expected.to validate_inclusion_of(:status).in_array(ContactStatus.list)
    end
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
    it { is_expected.to have_db_column(:message).of_type(:text) }
    it { is_expected.to have_db_column(:contact_category_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:status) }
    it { is_expected.to have_db_index(:contact_category_id) }
  end

  context 'factories' do
    it { expect(build(:contact)).to be_valid }
    it { expect(build(:invalid_contact)).to_not be_valid }
  end
end
