require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'associations' do
    it { expect(described_class).to respond_to(:acts_as_authorization_role) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:authorizable_id).of_type(:integer) }
    it { is_expected.to have_db_column(:authorizable_type).of_type(:string) }

    it do
      is_expected.to have_db_column(:name).of_type(:string)
        .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:system).of_type(:boolean)
        .with_options(default: false, null: false)
    end
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:name) }
    it { is_expected.to have_db_index([:authorizable_type, :authorizable_id]) }
  end
end
