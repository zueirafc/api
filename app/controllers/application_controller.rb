class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::ImplicitRender
  include ActionController::Serialization
  include Acl9::ControllerExtensions

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :restrict_access

  respond_to :json

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username << :club_id
  end

  def restrict_access
    restrict_access_by_url || restrict_access_by_header
  end

  def restrict_access_by_header
    authenticate_with_http_token do |token|
      ApiKey.exists?(access_token: token)
    end
  end

  def restrict_access_by_url
    ApiKey.exists?(access_token: params[:token])
  end

  protected

  def authenticate_with_http_token(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")

    respond_with error: {
      status: 500,
      message: 'Invalid API key, pass by "token" param or by header.'
    }
  end
end
