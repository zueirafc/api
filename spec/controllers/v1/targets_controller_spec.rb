require 'rails_helper'

module V1
  RSpec.describe TargetsController, type: :controller do
    describe 'GET #most_targeted' do
      it 'returns a collection of targets' do
        target = create :target, :with_club

        get :most_targeted, format: :json
        targets = assigns(:targets)[:targets]

        expect(targets.first[:club]).to eq(target.targetable)
        expect(targets.first[:quantity]).to eq(1)
      end

      it 'only 5 targets' do
        target2 = create :target, :with_club
        create :target, targetable: target2.targetable
        create :target, targetable: target2.targetable
        create :target, targetable: target2.targetable

        target3 = create :target, :with_club
        create :target, targetable: target3.targetable
        create :target, :with_club
        create :target, :with_club
        create :target, :with_club
        create :target, :with_club

        get :most_targeted, format: :json
        targets = assigns(:targets)[:targets]

        expect(targets.count).to eq(5)

        expect(targets.first[:club]).to eq(target2.targetable)
        expect(targets.first[:quantity]).to eq(4)

        expect(targets.second[:club]).to eq(target3.targetable)
        expect(targets.second[:quantity]).to eq(2)
      end
    end
  end
end
