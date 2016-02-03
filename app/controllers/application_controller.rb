class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # include Acl9::ControllerExtensions

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :restrict_access

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
      true
      # ApiKey.exists?(access_token: token)
    end
  end

  def restrict_access_by_url
    true
    # ApiKey.exists?(access_token: params[:token])
  end
end
