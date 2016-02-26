module Api
  module V1
    class MicropostParticipantsController < ApplicationController
      def trollers
        @trollers = Troller.valid_ones

        respond_with @trollers
      end

      def targets
        @targets = Target.valid_ones

        respond_with @targets
      end
    end
  end
end
