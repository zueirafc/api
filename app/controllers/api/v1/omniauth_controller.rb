module Api
  module V1
    class OmniauthController < DeviseTokenAuth::OmniauthCallbacksController
      protected

      def assign_provider_attrs(user, auth_hash)
        info = auth_hash['info']

        user.assign_attributes(name: info['name'],
                               remote_image_url: "#{info['image']}?type=large",
                               email: info['email']) if facebook? auth_hash
      end

      private

      def facebook?(hash)
        hash['provider'].eql? 'facebook'
      end
    end
  end
end
