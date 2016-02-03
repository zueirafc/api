require 'rails_helper'

# rubocop:disable Metrics/LineLength
module Api
  module V1
    RSpec.describe SourcesController, type: :controller do
      let(:valid_attributes) { attributes_for(:source) }
      let(:invalid_attributes) { attributes_for(:invalid_source) }

      describe 'GET #index' do
        it 'returns a collection of sources' do
          source = create :source, valid_attributes

          get :index, format: :json

          expect(assigns(:sources)).to include(source)
        end
      end

      context 'dynamic methods' do
        describe '.make_list_actions_by' do
          let!(:active_source) { create :source, status: CommonStatus::ACTIVE }
          let!(:inactive_source) { create :source, status: CommonStatus::INACTIVE }

          describe 'GET #active' do
            it 'returns a collection of sources' do
              get :active, format: :json

              expect(assigns(:sources)).to include(active_source)
              expect(assigns(:sources)).to_not include(inactive_source)
            end
          end

          describe 'GET #inactive' do
            it 'returns a collection of sources' do
              get :inactive, format: :json

              expect(assigns(:sources)).to include(inactive_source)
              expect(assigns(:sources)).to_not include(active_source)
            end
          end
        end
      end

      describe 'GET #show' do
        it 'returns a source passed by param' do
          source = create :source, valid_attributes

          get :show, id: source.to_param, format: :json
          expect(assigns(:source)).to eq(source)

          source = SourceSerializer.new(source).to_json

          expect(response.body['id']).to eq(source['id'])
          expect(response.body['club_id']).to eq(source['club_id'])
          expect(response.body['name']).to eq(source['name'])
          expect(response.body['kind']).to eq(source['kind'])
          expect(response.body['key']).to eq(source['key'])
          expect(response.body['status']).to eq(source['status'])
          expect(response.body['root_url']).to eq(source['root_url'])
        end
      end

      describe 'POST #create' do
        context 'with valid params' do
          it 'creates a new Source' do
            expect do
              post :create, format: :json, source: valid_attributes
            end.to change(Source, :count).by(1)
          end

          it 'assigns a newly created source as @source' do
            post :create, format: :json, source: valid_attributes

            expect(assigns(:source)).to be_a(Source)
            expect(assigns(:source)).to be_persisted
          end

          it 'redirects to the created source' do
            post :create, format: :json, source: valid_attributes

            expect(response).to be_created
          end
        end

        context 'with invalid params' do
          it 'assigns a newly created but unsaved source as @source' do
            post :create, format: :json, source: invalid_attributes

            expect(assigns(:source)).to be_a_new(Source)
          end

          it 'return source for unprocessed entity' do
            post :create, format: :json, source: invalid_attributes

            expect(response).to be_unprocessable
          end
        end
      end

      describe 'PUT #update' do
        context 'with valid params' do
          let(:new_attributes) { attributes_for :source, name: 'nn', key: 'ky' }

          it 'updates the requested source' do
            source = create :source, valid_attributes

            put :update, id: source.to_param, source: new_attributes, format: :json
            source.reload

            expect(source.name).to eq('nn')
            expect(source.key).to eq('ky')
            expect(response).to be_success
          end

          it 'assigns the requested source as @source' do
            source = create :source, valid_attributes

            put :update, format: :json, id: source.to_param,
                         source: valid_attributes

            expect(assigns(:source)).to eq(source)
          end
        end

        context 'with invalid params' do
          it 'assigns the source as @source' do
            source = create :source, valid_attributes

            put :update, format: :json, id: source.to_param,
                         source: invalid_attributes

            expect(assigns(:source)).to eq(source)
          end

          it 'return source for unprocessed entity' do
            source = create :source, valid_attributes

            put :update, format: :json, id: source.to_param,
                         source: invalid_attributes

            expect(response).to be_unprocessable
          end
        end
      end

      describe 'DELETE #destroy' do
        it 'destroys the requested source' do
          source = create :source, valid_attributes

          expect do
            delete :destroy, format: :json, id: source.to_param
          end.to change(Source, :count).by(-1)
        end

        it 'redirects to the source list' do
          source = create :source, valid_attributes

          delete :destroy, format: :json, id: source.to_param

          expect(response).to be_success
        end
      end
    end
  end
end
