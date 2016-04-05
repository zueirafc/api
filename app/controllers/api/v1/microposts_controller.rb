module Api
  module V1
    class MicropostsController < ApplicationController
      before_action :set_micropost,
                    only: [:show, :update, :destroy, :activate, :delete, :ban]

      include DynamicActionable
      make_list_actions_by MicropostStatus, Micropost

      def index
        @microposts = paginate Micropost.all

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

      def activate
        Actions::MicropostService.new(@micropost).activate!

        respond_with :api, :v1, @micropost
      end

      def delete
        Actions::MicropostService.new(@micropost).delete!

        respond_with :api, :v1, @micropost
      end

      def ban
        Actions::MicropostService.new(@micropost).ban!

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
                      :title,
                      trollers_attributes: [:trollerable_id, :trollerable_type],
                      targets_attributes: [:targetable_id, :targetable_type]
      end
    end
  end
end
