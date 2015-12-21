class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include ActionController::Serialization
  include Acl9::ControllerExtensions

  respond_to :json
end
