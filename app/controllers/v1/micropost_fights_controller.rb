module V1
  class MicropostFightsController < ApplicationController
    before_action :set_nicknames, only: :versus

    def versus
      @microposts = call_scope_based_on_parameters

      respond_with :v1, @microposts
    end

    private

    def set_nicknames
      troller = params[:troller_nick_id]
      target = params[:target_nick_id]

      @troller = NicknameFan.find(troller) unless valid_nick?(troller)
      @target = NicknameFan.find(target) unless valid_nick?(target)
    end

    def call_scope_based_on_parameters
      if @troller && @target
        Micropost.versus_microposts_from_nicks(@troller, @target)
      elsif @troller
        Micropost.troller_microposts_from_nick(@troller)
      elsif @target
        Micropost.target_microposts_from_nick(@target)
      end
    end

    def valid_nick?(id)
      id.to_i.zero?
    end
  end
end
