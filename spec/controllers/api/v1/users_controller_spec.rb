require 'rails_helper'

module Api
  module V1
    RSpec.describe UsersController, type: :controller do
      let(:valid_mail) { 'name@email.com' }
      let(:invalid_mail) { 'name@email' }

      let(:valid_attributes) { attributes_for(:user, email: valid_mail) }

      describe 'GET #exists' do
        context 'when is valid email' do
          it 'returns a true if exist user' do
            create :user, valid_attributes

            get :exists, email: valid_mail, format: :json
            json = JSON.parse(response.body)

            expect(json['exists']).to eq(true)
            expect(json['email']).to eq(valid_mail)
          end

          it 'returns false if not exists' do
            get :exists, email: valid_mail, format: :json
            json = JSON.parse(response.body)

            expect(json['exists']).to eq(false)
            expect(json['email']).to eq(valid_mail)
          end
        end

        context 'when is invalid email' do
          it 'returns a false response' do
            create :user, valid_attributes

            get :exists, email: invalid_mail, format: :json
            json = JSON.parse(response.body)

            expect(User).to_not receive(:exists?).with(email: invalid_mail)

            expect(json['exists']).to eq(nil)
            expect(json['email']).to eq(invalid_mail)
          end
        end

        context 'when is invalid email' do
          it 'returns a false response' do
            create :user, valid_attributes

            get :exists, email: '', format: :json
            json = JSON.parse(response.body)

            expect(json['exists']).to eq(false)
            expect(json['email']).to eq('')
          end
        end
      end
    end
  end
end
