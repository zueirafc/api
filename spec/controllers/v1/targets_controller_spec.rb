require 'rails_helper'

module V1
  RSpec.describe TargetsController, type: :controller do
    describe 'GET #most_targeted' do
      it 'returns a collection of targets' do
        target = create :target, :with_club

        get :most_targeted, format: :json

        expect(assigns(:targets).first.targetable).to eq(target.targetable)
      end
    end
  end
end
