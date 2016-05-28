require 'rails_helper'

module V1
  RSpec.describe TargetsController, type: :controller do
    describe 'GET #most_targeted' do
      it 'returns a collection of targets' do
        target = create :target, :with_club

        get :most_targeted, format: :json
        first = assigns(:targets)[:targets].first

        expect(first.object).to eq(target.targetable)
        expect(first.scope[:quantity]).to eq(1)
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
        first = targets.first
        second = targets.second

        expect(targets.count).to eq(5)

        expect(first.object).to eq(target2.targetable)
        expect(first.scope[:quantity]).to eq(4)

        expect(second.object).to eq(target3.targetable)
        expect(second.scope[:quantity]).to eq(2)
      end
    end
  end
end
