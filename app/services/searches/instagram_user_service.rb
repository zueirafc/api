module Searches
  class InstagramUserService
    class << self
      def find_media_items_for(_event)
        params = { count: 100, max_tag_id: source.last.try(&:provider_id) }

        Instagram.client.tag_recent_media(source.key, params).each do |item|
          begin
            create_micropost_using!(item, source)
          rescue => e
            Rails.logger.info "--- ERROR at #{self}: #{e.message} ---\n"
          end
        end
      end

      private

      def create_micropost_using(media, source)
        ActiveRecord::Base.transaction do
          post = Micropost.create provider_id: media.id,
                                  text: media.caption.text,
                                  source: source,
                                  status: MicropostStatus::PENDING

          attach_troller_to post, from: source
          attach_content_to post, from: media
        end
      end

      def attach_content_to(post, from:)
        from.images.each do |item|
          Medium.create do |m|
            m.micropost = post
            m.remote_file_url = item.standard_resolution.url.to_s
          end
        end
      end

      def attach_troller_to(post, from:)
        post.trollers << Troller.new(trollerable: from.club)
      end
    end
  end
end
