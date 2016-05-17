module V1
  class NicknameFansController < ApplicationController
    before_action :set_club, only: :from_club
    skip_before_action :authenticate_user!

    def index
      @fans = NicknameFan.all

      respond_with :v1, @fans
    end

    def from_club
      @fans = @club.nickname_fans

      respond_with :v1, @fans
    end

    private

    def set_club
      @club = Club.find(params[:id])
    end
  end
end
