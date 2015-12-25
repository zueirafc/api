require 'rails_helper'

module Api
  module V1
    RSpec.describe ClubsController, type: :controller do
      let(:valid_attributes) { attributes_for(:club) }
      let(:invalid_attributes) { attributes_for(:invalid_club) }

      describe 'GET #index' do
        it 'returns a collection of clubs' do
          club = create :club, valid_attributes

          get :index, format: :json

          expect(assigns(:clubs)).to include(club)
        end
      end

      describe 'GET #show' do
        it 'returns a club passed by param' do
          club = create :club, valid_attributes

          get :show, id: club.to_param, format: :json
          expect(assigns(:club)).to eq(club)

          club = ClubSerializer.new(club).to_json
          expect(response.body['id']).to eq(club['id'])
          expect(response.body['shield']).to eq(club['shield'])
          expect(response.body['short_name']).to eq(club['short_name'])
          expect(response.body['initials']).to eq(club['initials'])
          expect(response.body['full_name']).to eq(club['full_name'])
          expect(response.body['official_website']).to eq(club['official_website'])
          expect(response.body['official_facebook_page']).to eq(club['official_facebook_page'])
          expect(response.body['official_twitter_page']).to eq(club['official_twitter_page'])
        end
      end

      describe 'POST #create' do
        context 'with valid params' do
          it 'creates a new Club' do
            expect do
              post :create, format: :json, club: valid_attributes
            end.to change(Club, :count).by(1)
          end

          it 'assigns a newly created club as @club' do
            post :create, format: :json, club: valid_attributes

            expect(assigns(:club)).to be_a(Club)
            expect(assigns(:club)).to be_persisted
          end

          it 'redirects to the created club' do
            post :create, format: :json, club: valid_attributes

            expect(response).to be_created
          end
        end

        context 'with invalid params' do
          it 'assigns a newly created but unsaved club as @club' do
            post :create, format: :json, club: invalid_attributes

            expect(assigns(:club)).to be_a_new(Club)
          end

          it 'return club for unprocessed entity' do
            post :create, format: :json, club: invalid_attributes

            expect(response).to be_unprocessable
          end
        end
      end

      describe 'PUT #update' do
        context 'with valid params' do
          let(:new_attributes) { attributes_for :club }

          it 'updates the requested club' do
            club = create :club, valid_attributes

            put :update, id: club.to_param, club: new_attributes, format: :json
            club.reload

            expect(club.short_name).to eq(new_attributes[:short_name])
            expect(club.full_name).to eq(new_attributes[:full_name])
            expect(club.shield).to eq(new_attributes[:shield])
            expect(response).to be_success
          end

          it 'assigns the requested club as @club' do
            club = create :club, valid_attributes

            put :update, format: :json, id: club.to_param,
                         club: valid_attributes

            expect(assigns(:club)).to eq(club)
          end
        end

        context 'with invalid params' do
          it 'assigns the club as @club' do
            club = create :club, valid_attributes

            put :update, format: :json, id: club.to_param,
                         club: invalid_attributes

            expect(assigns(:club)).to eq(club)
          end

          it 'return club for unprocessed entity' do
            club = create :club, valid_attributes

            put :update, format: :json, id: club.to_param,
                         club: invalid_attributes

            expect(response).to be_unprocessable
          end
        end
      end

      describe 'DELETE #destroy' do
        it 'destroys the requested club' do
          club = create :club, valid_attributes

          expect do
            delete :destroy, format: :json, id: club.to_param
          end.to change(Club, :count).by(-1)
        end

        it 'redirects to the club list' do
          club = create :club, valid_attributes

          delete :destroy, format: :json, id: club.to_param

          expect(response).to be_success
        end
      end
    end
  end
end
