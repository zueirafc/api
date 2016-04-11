require 'rails_helper'

RSpec.describe Club, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:troller_sources) }
    it { is_expected.to have_many(:target_sources) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:shield) }
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:short_name) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:official_website).of_type(:string) }
    it { should have_db_column(:official_twitter_page).of_type(:string) }
    it { should have_db_column(:official_facebook_page).of_type(:string) }
    it { is_expected.to have_db_column(:initials).of_type(:string) }
    it { is_expected.to have_db_column(:full_name).of_type(:string) }
    it { is_expected.to have_db_column(:short_name).of_type(:string) }
    it { is_expected.to have_db_column(:shield).of_type(:string) }
  end

  context 'factories' do
    it { expect(build(:club)).to be_valid }
    it { expect(build(:invalid_club)).to_not be_valid }
  end
end
