require 'rails_helper'

module Api
  module V1
    RSpec.describe MicropostParticipantsController, type: :controller do
      before do
        editions = create_list :league_edition, 2
        clubs = create_list :club, 2

        create :league_participant, club: clubs.first, edition: editions.first
        create :league_participant, club: clubs.last, edition: editions.last
      end

      let(:results) { { clubs: Club.all, leagues: LeagueEdition.all } }

      describe 'GET #targets' do
        it 'returns a collection of clubs and leagues editions' do
          get :trollers, format: :json

          expect(assigns(:trollers)).to eq(results)
        end
      end

      describe 'GET #trollers' do
        it 'returns a collection of clubs and leagues editions' do
          get :targets, format: :json

          expect(assigns(:targets)).to eq(results)
        end
      end
    end
  end
end
