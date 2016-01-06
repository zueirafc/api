require 'rails_helper'

RSpec.describe ContactCategory, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:contacts) }
  end

  context 'model validations' do
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
  end

  context 'table indexes' do
  end
end
