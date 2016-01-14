require 'rails_helper'

RSpec.describe Source, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:club) }
    it { is_expected.to have_many(:microposts) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:key) }

    it :status do
      is_expected.to validate_presence_of(:status)
      is_expected.to validate_inclusion_of(:status).in_array(CommonStatus.list)
    end

    it :kind do
      is_expected.to validate_presence_of(:kind)
      is_expected.to validate_inclusion_of(:kind).in_array(SourceKind.list)
    end
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:key).of_type(:string) }
    it { is_expected.to have_db_column(:kind).of_type(:integer) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
    it { is_expected.to have_db_column(:club_id).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:status) }
    it { is_expected.to have_db_index(:kind) }

    it { is_expected.to have_db_index(:club_id) }
  end

  context 'factories' do
    it { expect(build(:source)).to be_valid }
    it { expect(build(:invalid_source)).to_not be_valid }
  end

  context 'instance methods' do
    context 'respond_to methods' do
      let(:source) { build(:source) }

      it { is_expected.to respond_to :last }
    end

    describe '#last' do
      let(:micropost) { create :micropost }
      let(:source) { micropost.source }
      let(:micropost_2) { create :micropost, source: source }

      it 'needs to return the last micropost' do
        expect(source.microposts).to eq([micropost, micropost_2])

        expect(source.last).to eq(micropost_2)
      end
    end
  end
end
