require 'rails_helper'

RSpec.describe Micropost, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:source) }

    it { is_expected.to have_many(:media) }
    it { is_expected.to have_many(:targets) }
    it { is_expected.to have_many(:trollers) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:text) }

    it :status do
      is_expected.to validate_presence_of(:status)
      is_expected.to validate_inclusion_of(:status)
        .in_array(MicropostStatus.list)
    end
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
