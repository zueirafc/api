module Api
  module V1
    class SourcesController < ApplicationController
      before_action :set_source, only: [:show, :update, :destroy]

      include DynamicActionable
      make_list_actions_by CommonStatus, Source

      def index
        @sources = Source.all

        respond_with :api, :v1, @sources
      end

      def show
        respond_with :api, :v1, @source
      end

      def create
        @source = Source.new(source_params)
        @source.save

        respond_with :api, :v1, @source
      end

      def update
        @source.update(source_params)

        respond_with :api, :v1, @source
      end

      def destroy
        @source.destroy

        respond_with :api, :v1, @source
      end

      private

      def set_source
        @source = Source.find(params[:id])
      end

      def source_params
        params.require(:source).permit(:name, :key, :kind, :status, :club_id)
      end
    end
  end
end
