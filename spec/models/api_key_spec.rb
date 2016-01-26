require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  context 'table fields' do
    it do
      is_expected.to have_db_column(:access_token).of_type(:string)
        .with_options(null: false, limit: 255)
    end
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:access_token) }
  end

  context 'factories' do
    it { expect(build(:api_key)).to be_valid }
  end
end
