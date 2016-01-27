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
    return true if restrict_access_by_header

    render json: {message: 'Invalid API Token'}, status: 401
  end

  def restrict_access_by_header
    authenticate_or_request_with_http_token do |token, _|
      ApiKey.exists?(access_token: token)
    end
  end
  #
  # def restrict_access_by_url
  #   return true if @api_key
  #
  #   @api_key = ApiKey.find_by_access_token(params[:token])
  # end
end
