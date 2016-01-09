require 'rails_helper'

RSpec.describe PostReference, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:micropost) }
    it { is_expected.to belong_to(:referenceable) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:micropost) }
    it { is_expected.to validate_presence_of(:referenceable) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:micropost_id).of_type(:integer) }
    it { is_expected.to have_db_column(:referenceable_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { should have_db_index(:micropost_id) }
    it { should have_db_index([:referenceable_id, :referenceable_type]) }
  end

  context 'factories' do
    it { expect(build(:post_reference, :with_user)).to be_valid }
    it { expect(build(:invalid_post_reference)).to_not be_valid }
  end
end
