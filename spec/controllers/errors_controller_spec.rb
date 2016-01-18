require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do
  describe 'GET #not_found' do
    it 'returns http not found' do
      message = { error: { status: 404, message: 'Not Found' } }

      get :not_found, format: :json

      expect(response).to have_http_status(:success)
      expect(response.body).to eq(message.to_json)
    end
  end

  describe 'GET #internal_server_error' do
    it 'returns http success' do
      message = { error: { status: 500, message: 'Internal Server Error' } }
      get :internal_server_error, format: :json

      expect(response).to have_http_status(:success)
      expect(response.body).to eq(message.to_json)
    end
  end
end
