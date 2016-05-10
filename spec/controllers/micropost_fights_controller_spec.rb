require 'rails_helper'

module V1
  RSpec.describe MicropostFightsController, type: :controller do
    describe 'GET #versus' do
      let!(:nick) { create :nickname_fan }
      let!(:id) { nick.id }

      it 'returns http success' do
        get :versus, troller_nick_id: id, target_nick_id: id, format: :json

        expect(response).to have_http_status(:success)
      end

      it 'call versus_microposts_from_nicks scope' do
        expect(Micropost).to receive(:versus_microposts_from_nicks)
          .with(nick, nick)

        get :versus, troller_nick_id: id, target_nick_id: id, format: :json
      end

      it 'call troller_microposts_from_nick scope' do
        expect(Micropost).to receive(:troller_microposts_from_nick).with(nick)

        get :versus, troller_nick_id: id, target_nick_id: 0, format: :json
      end

      it 'call target_microposts_from_nick scope' do
        expect(Micropost).to receive(:target_microposts_from_nick).with(nick)

        get :versus, troller_nick_id: 0, target_nick_id: id, format: :json
      end
    end
  end
end
