module Api
  module V1
    class MicropostsController < ApplicationController
      before_action :set_micropost, only: [:show, :update, :destroy]

      def index
        @microposts = Micropost.all

        respond_with :api, :v1, @microposts
      end

      def show
        respond_with :api, :v1, @micropost
      end

      def create
        @micropost = Micropost.new(micropost_params)
        @micropost.save

        respond_with :api, :v1, @micropost
      end

      def update
        @micropost = Micropost.find(params[:id])
        @micropost.update(micropost_params)

        respond_with :api, :v1, @micropost
      end

      def destroy
        @micropost.destroy

        respond_with :api, :v1, @micropost
      end

      private

      def set_micropost
        @micropost = Micropost.find(params[:id])
      end

      def micropost_params
        params.require(:micropost)
              .permit :user_id, :source_id, :text, :all_targets, :all_trollers,
                      :status, :shared, :is_shared, :provider_id, :provider_url,
                      :title
      end
    end
  end
end
