require 'rails_helper'

RSpec.describe MicropostFightsController, type: :controller do
  describe 'GET #versus' do
    it 'returns http success' do
      get :versus
      expect(response).to have_http_status(:success)
    end
  end
end
