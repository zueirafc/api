module V1
  class TargetsController < ApplicationController
    before_action :make_a_json, only: :most_targeted
    skip_before_action :authenticate_user!, only: :most_targeted

    def most_targeted
      respond_with :v1, @targets
    end

    private

    def make_a_json
      @targets = { targets: [] }

      Target.clubs.group(:targetable_id).count.sort_by(&:last).reverse
            .take(5).each do |club_id, qtd|
        @targets[:targets] << { club: Club.find(club_id), quantity: qtd }
      end
    end
  end
end
