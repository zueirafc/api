require 'rails_helper'

RSpec.describe NicknameFan, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:club) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:club) }
    it { is_expected.to validate_presence_of(:name) }

    it :status do
      is_expected.to validate_presence_of(:status)
      is_expected.to validate_inclusion_of(:status).in_array(CommonStatus.list)
    end
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:plural).of_type(:string) }

    it { is_expected.to have_db_column(:status).of_type(:integer) }
  end

  context 'table indexes' do
    it { should have_db_index(:status) }

    it { should have_db_index(:club_id) }
  end

  context 'factories' do
    it { expect(build(:nickname_fan)).to be_valid }
    it { expect(build(:invalid_nickname_fan)).to_not be_valid }
  end

  context 'callbacks' do
    describe '#pluralize_name' do
      it 'need create valid plural when nil plural are passed' do
        nick = NicknameFan.new(name: 'corintiano')

        expect(nick.plural).to eq('corintianos')
      end

      it 'need create valid plural when plural are passed' do
        nick = NicknameFan.new(name: 'corintiano', plural: 'fiel torcida')

        expect(nick.plural).to eq('fiel torcida')
      end

      it 'need do nothing when nothing is passed' do
        nick = NicknameFan.new(name: '')

        expect(nick.plural).to eq(nil)
      end
    end
  end
end
