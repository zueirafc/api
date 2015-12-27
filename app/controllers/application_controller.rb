class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::ImplicitRender
  include ActionController::Serialization
  include Acl9::ControllerExtensions

  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :null_session

  respond_to :json

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :club_id)
    end
    
    devise_parameter_sanitizer.for(:account_update) do |u|
       u.permit(:username, :club_id)
    end
  end
end
