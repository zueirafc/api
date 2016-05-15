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
    it do
      is_expected.to have_db_column(:provider_id).of_type(:string)
        .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:text).of_type(:text)
        .with_options(null: false)
    end
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

    it { is_expected.to have_db_column(:provider_url).of_type(:string) }
    it { is_expected.to have_db_column(:title).of_type(:string) }
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

  context 'scopes' do
    let!(:club1) { create :club }
    let!(:club2) { create :club }

    let!(:nick1) { create :nickname_fan, club: club1 }
    let!(:nick2) { create :nickname_fan, club: club2 }

    describe '.troller_microposts_from_nick' do
      let(:troller1) { create :troller, trollerable: club1 }
      let(:troller11) { create :troller, trollerable: club1 }
      let(:target1) { create :target, targetable: club1 }

      let(:troller2) { create :troller, trollerable: club2 }
      let(:target2) { create :target, targetable: club2 }

      let!(:micropost) { create :micropost, trollers: [troller1] }
      let!(:micropost2) { create :micropost, trollers: [troller11, troller2] }

      it 'need to get right posts' do
        list = described_class.troller_microposts_from_nick(nick1)

        expect(list).to eq([micropost2, micropost])
      end
    end

    describe '.target_microposts_from_nick' do
      let(:troller1) { create :troller, trollerable: club1 }
      let(:target1) { create :target, targetable: club1 }
      let(:target11) { create :target, targetable: club1 }

      let(:troller2) { create :troller, trollerable: club2 }
      let(:target2) { create :target, targetable: club2 }

      let!(:micropost) { create :micropost, targets: [target1] }
      let!(:micropost2) { create :micropost, targets: [target11, target2] }

      it 'need to get right posts' do
        list = described_class.target_microposts_from_nick(nick1)

        expect(list).to eq([micropost2, micropost])
      end
    end

    describe '.versus_microposts_from_nicks' do
      let(:troller1) { create :troller, trollerable: club1 }
      let(:target1) { create :target, targetable: club1 }

      let(:troller2) { create :troller, trollerable: club2 }
      let(:target2) { create :target, targetable: club2 }

      let!(:micropost) do
        create :micropost, trollers: [troller1], targets: [target1, target2]
      end

      it 'need to get right posts' do
        list = described_class.versus_microposts_from_nicks(nick1, nick2)

        expect(list).to eq([micropost])
      end
    end
  end
end
