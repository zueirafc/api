class ErrorsController < ApplicationController
  def not_found
    respond_with make_a_error(status: 404, message: 'Not Found')
  end

  def internal_server_error
    respond_with make_a_error(status: 500, message: 'Internal Server Error')
  end

  def unauthorized
    message = "Invalid API key, pass by 'token' param or by header."

    respond_with make_a_error(status: 401, message: message)
  end

  private

  def make_a_error(status:, message:)
    { error: { status: status, message: message } }
  end
end
