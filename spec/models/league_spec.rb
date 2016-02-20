require 'rails_helper'

RSpec.describe League, type: :model do
  context 'associations' do
  end

  context 'model validations' do
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:country).of_type(:string) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
    it { is_expected.to have_db_column(:codename).of_type(:string) }
  end

  context 'table indexes' do
  end

  context 'factories' do
    it { expect(build(:league)).to be_valid }
    it { expect(build(:invalid_league)).to_not be_valid }
  end
end
