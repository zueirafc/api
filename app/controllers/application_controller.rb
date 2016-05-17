class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Acl9::ControllerExtensions

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  respond_to :html, :json

  protected

  def configure_permitted_parameters
    [:sign_up, :account_update].each do |item|
      devise_parameter_sanitizer.for(item) << :club_id << :image
    end
  end
end
