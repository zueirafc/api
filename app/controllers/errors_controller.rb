class ErrorsController < ApplicationController
  def not_found
    respond_with error: { status: 404, message: 'Not Found' }
  end

  def internal_server_error
    respond_with error: { status: 500, message: 'Internal Server Error' }
  end
end
