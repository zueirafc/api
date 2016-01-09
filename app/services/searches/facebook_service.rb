module Searches
  class FacebookService
    class << self
      def find_posts_for(event)
        params = { count: 100, max_tag_id: event.medias.last.try(&:id) }

        Instagram.client.tag_recent_media(event.hash_tag, params).each do |media|
          begin
            ActiveRecord::Base.transaction { event.items << make_a_item_by(media) }
          rescue => e
            Rails.logger.info "----- ERROR at facebook: #{e.message} -----\n"
          end
        end
      end

      def make_a_item_by(media)
        return unless media

        item = Item.new(id: media.id.to_i,
                        text: media.caption.text,
                        status: ItemStatus::LISTED,
                        author: make_an_author_by(media.user),
                        service: ServiceKind::FACEBOOK)

        item.remote_image_url = media.images.standard_resolution.url if media.images.present?

        item
      end

      def make_an_author_by(user)
        author = Author.find_or_create_by!(id: user.id.to_i,
                                           name: user.try(&:fullname) || 'username',
                                           screen_name: "@#{user.username}",
                                           profile_url: "https://instagram.com/#{user.username}",
                                           service: ServiceKind::FACEBOOK)

        author.remote_avatar_url = user.profile_picture.to_s unless author.avatar?

        author
      end
    end
  end
end
