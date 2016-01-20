require 'rails_helper'

# rubocop:disable Metrics/LineLength
module Api
  module V1
    RSpec.describe MicropostsController, type: :controller do
      let(:valid_attributes) { attributes_for(:micropost) }
      let(:invalid_attributes) { attributes_for(:invalid_micropost) }

      describe 'GET #index' do
        it 'returns a collection of microposts' do
          micropost = create :micropost, valid_attributes

          get :index, format: :json

          expect(assigns(:microposts)).to include(micropost)
        end
      end

      describe 'GET #show' do
        it 'returns a complete micropost passed by param' do
          micropost = create :micropost, valid_attributes

          get :show, id: micropost.to_param, format: :json
          expect(assigns(:micropost)).to eq(micropost)

          micropost = MicropostSerializer.new(micropost).to_json
          expect(response.body['id']).to eq(micropost['id'])
          expect(response.body['source_id']).to eq(micropost['source_id'])
          expect(response.body['user_id']).to eq(micropost['user_id'])
          expect(response.body['text']).to eq(micropost['text'])
          expect(response.body['status']).to eq(micropost['status'])
          expect(response.body['shared']).to eq(micropost['shared'])
          expect(response.body['all_targets']).to eq(micropost['all_targets'])
          expect(response.body['all_trollers']).to eq(micropost['all_trollers'])
          expect(response.body['is_shared']).to eq(micropost['is_shared'])
          expect(response.body['provider_id']).to eq(micropost['provider_id'])
          expect(response.body['provider_url']).to eq(micropost['provider_url'])
          expect(response.body['title']).to eq(micropost['title'])
        end
      end

      describe 'POST #create' do
        context 'with valid params' do
          it 'creates a new Micropost' do
            expect do
              post :create, format: :json, micropost: valid_attributes
            end.to change(Micropost, :count).by(1)
          end

          it 'assigns a newly created micropost as @micropost' do
            post :create, format: :json, micropost: valid_attributes

            expect(assigns(:micropost)).to be_a(Micropost)
            expect(assigns(:micropost)).to be_persisted
          end

          it 'redirects to the created micropost' do
            post :create, format: :json, micropost: valid_attributes

            expect(response).to be_created
          end
        end

        context 'with invalid params' do
          it 'assigns a newly created but unsaved micropost as @micropost' do
            post :create, format: :json, micropost: invalid_attributes

            expect(assigns(:micropost)).to be_a_new(Micropost)
          end

          it 'return micropost for unprocessed entity' do
            post :create, format: :json, micropost: invalid_attributes

            expect(response).to be_unprocessable
          end
        end
      end

      describe 'PUT #update' do
        context 'with valid params' do
          let(:new_attributes) { attributes_for :micropost, title: 'new name' }

          it 'updates the requested micropost' do
            micropost = create :micropost, valid_attributes

            put :update, id: micropost.to_param, micropost: new_attributes, format: :json
            micropost.reload

            expect(micropost.title).to eq('new name')
            expect(response).to be_success
          end

          it 'assigns the requested micropost as @micropost' do
            micropost = create :micropost, valid_attributes

            put :update, format: :json, id: micropost.to_param,
                         micropost: valid_attributes

            expect(assigns(:micropost)).to eq(micropost)
          end
        end

        context 'with invalid params' do
          it 'assigns the micropost as @micropost' do
            micropost = create :micropost, valid_attributes

            put :update, format: :json, id: micropost.to_param,
                         micropost: invalid_attributes

            expect(assigns(:micropost)).to eq(micropost)
          end

          it 'return micropost for unprocessed entity' do
            micropost = create :micropost, valid_attributes

            put :update, format: :json, id: micropost.to_param,
                         micropost: invalid_attributes

            expect(response).to be_unprocessable
          end
        end
      end

      describe 'DELETE #destroy' do
        it 'destroys the requested micropost' do
          micropost = create :micropost, valid_attributes

          expect do
            delete :destroy, format: :json, id: micropost.to_param
          end.to change(Micropost, :count).by(-1)
        end

        it 'redirects to the micropost list' do
          micropost = create :micropost, valid_attributes

          delete :destroy, format: :json, id: micropost.to_param

          expect(response).to be_success
        end
      end
    end
  end
end
