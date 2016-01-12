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
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_presence_of(:provider_id) }

    it :status do
      is_expected.to validate_presence_of(:status)
      is_expected.to validate_inclusion_of(:status)
        .in_array(MicropostStatus.list)
    end
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:text).of_type(:text).with_options(null: false) }
    it do
      is_expected.to have_db_column(:all_targets)
        .of_type(:boolean).with_options(null: false, default: false)
    end
    it do
      is_expected.to have_db_column(:all_trollers)
        .of_type(:boolean).with_options(null: false, default: false)
    end
    it do
      is_expected.to have_db_column(:is_shared)
        .of_type(:boolean).with_options(default: false)
    end
    it do
      is_expected.to have_db_column(:shared)
        .of_type(:integer).with_options(default: 0)
    end
    it do
      is_expected.to have_db_column(:status)
        .of_type(:integer).with_options(default: 0)
    end
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:source_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:status) }

    it { is_expected.to have_db_index(:user_id) }
  end

  context 'factories' do
    it { expect(build(:micropost)).to be_valid }
    it { expect(build(:invalid_micropost)).to_not be_valid }
  end
end
