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

  # def restrict_access
  #    unless restrict_access_by_params || restrict_access_by_header
  #      render json: {message: 'Invalid API Token'}, status: 401
  #      return
  #    end
  #
  #    @current_user = @api_key.user if @api_key
  #  end
  #
  #  def restrict_access_by_header
  #    return true if @api_key
  #
  #    authenticate_with_http_token do |token|
  #      @api_key = ApiKey.find_by_token(token)
  #    end
  #  end
  #
  #  def restrict_access_by_params
  #    return true if @api_key
  #
  #    @api_key = ApiKey.find_by_token(params[:token])
  #  end

end
