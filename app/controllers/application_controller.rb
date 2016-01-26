class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::ImplicitRender
  include ActionController::Serialization
  include Acl9::ControllerExtensions
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :restrict_access

  respond_to :json

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username << :club_id
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, _options|
      ApiKey.exists?(access_token: token)
    end
  end
end
