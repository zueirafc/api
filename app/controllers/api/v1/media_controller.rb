module Api
  module V1
    class MediaController < ApplicationController
      before_action :set_micropost
      before_action :set_medium, only: :destroy

      def destroy
        @medium.destroy

        respond_with :api, :v1, @micropost
      end

      private

      def set_micropost
        @micropost = Micropost.find(params[:micropost_id])
      end

      def set_medium
        @medium = @micropost.media.find(params[:id])
      end
    end
  end
end
