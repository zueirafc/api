class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Acl9::ControllerExtensions

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :restrict_access

  respond_to :json

  protected

  def configure_permitted_parameters
    [:sign_up, :account_update].each do |item|
      devise_parameter_sanitizer.for(item) << :club_id << :username << :image
    end
  end

  def restrict_access
    return true if token? || restrict_access_by_url || restrict_access_by_header

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

  def token?
    %w(devise_token_auth omniauth).each do |name|
      return true if controller_path.match(/#{name}/).present?
    end

    false
  end
end
