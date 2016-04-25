require 'rails_helper'

module V1
  RSpec.describe NicknameFansController, type: :controller do
    describe 'GET #index' do
      it 'returns a collection of fans' do
        fan = create :nickname_fan

        get :index, format: :json

        expect(assigns(:fans)).to include(fan)
      end
    end

    describe 'GET #from_club' do
      it 'need to get only items from club' do
        club = create :club
        create_list :nickname_fan, 2, club: club

        get :from_club, id: club.to_param, format: :json

        expect(assigns(:fans).count).to eq(2)
        expect(assigns(:fans)).to eq(club.nickname_fans)
      end
    end
  end
end
