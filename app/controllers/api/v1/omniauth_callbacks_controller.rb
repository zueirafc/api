module Api
  module V1
    class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

      protected

      def assign_provider_attrs(user, auth_hash)
        user.assign_attributes({
          name: auth_hash['info']['name'],
          remote_image_url: "#{auth_hash['info']['image']}?type=large",
          email: auth_hash['info']['email']
        }) if facebook?(auth_hash['provider'])
      end

      private

      def facebook?(provider)
        provider.eql? 'facebook'
      end
    end
  end
end
