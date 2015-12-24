class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::ImplicitRender
  include ActionController::Serialization
  include Acl9::ControllerExtensions

  respond_to :json
end
