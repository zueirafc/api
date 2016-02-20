module Api
  module V1
    class UsersController < ApplicationController
      def exists
        existence = User.exists?(email: params[:email]) if valid_email?

        respond_with exists: existence, email: params[:email]
      end

      private

      # rubocop:disable Metrics/LineLength
      def valid_email?
        return true if params[:email] =~ /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/ix
      end
    end
  end
end
