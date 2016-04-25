module V1
  class TargetsController < ApplicationController
    def most_targeted
      @targets = Target.clubs.most_ones.take(5)

      respond_with :v1, @targets
    end
  end
end
