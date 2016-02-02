class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::ImplicitRender
  include ActionController::Serialization
  include Acl9::ControllerExtensions
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :restrict_access, unless: :devise_auth_token_controller?

  respond_to :json

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username << :club_id
  end

  def restrict_access
    return true if restrict_access_by_url || restrict_access_by_header

    redirect_to '/401?error=unauthorized' if params[:error].nil?
  end

  def restrict_access_by_header
    authenticate_with_http_token do |token|
      ApiKey.exists?(access_token: token)
    end
  end

  def restrict_access_by_url
    ApiKey.exists?(access_token: params[:token])
  end

  def devise_auth_token_controller?
    params[:controller].match(/devise_auth_token/).nil?
  end
end
