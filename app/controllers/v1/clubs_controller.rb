module V1
  class ClubsController < ApplicationController
    before_action :set_club, only: [:show, :update, :destroy]
    skip_before_action :authenticate_user!, only: :index

    def index
      @clubs = Club.all

      respond_with :v1, @clubs
    end

    def show
      respond_with :v1, @club
    end

    def create
      @club = Club.new(club_params)
      @club.save

      respond_with :v1, @club
    end

    def update
      @club.update(club_params)

      respond_with :v1, @club
    end

    def destroy
      @club.destroy

      respond_with :v1, @club
    end

    private

    def set_club
      @club = Club.find(params[:id])
    end

    def club_params
      params.require(:club).permit :shield, :official_website, :full_name,
                                   :official_facebook_page, :short_name,
                                   :initials, :official_twitter_page
    end
  end
end
