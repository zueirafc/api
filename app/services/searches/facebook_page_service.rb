# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
module Searches
  class FacebookPageService
    class << self
      def find_posts_for(source)
        last = source.last.try(&:provider_id)

        FacebookProvider.client.get_connections(source.key, KEYS)
                        .select { |e| e.key? 'object_id' }.each do |post|
          condition = breakers post['object_id'], last, source

          next if condition == 'next'
          break if condition == 'break'

          begin
            create_micropost_using!(post, source)
          rescue => e
            Rails.logger.warn "ERROR at #{self}: #{e.message}"
          end
        end
      end

      private

      FIELDS = %w(id object_id message link created_time full_picture type).freeze
      KEYS = "posts?fields=#{FIELDS.join(',')}".freeze

      def breakers(id, last, source)
        if reached_limit?(id, last)
          'break'
        elsif Micropost.exists?(source: source, provider_id: id)
          'next'
        end
      end

      def reached_limit?(id, last)
        id.to_s.eql?(last)
      end

      def create_micropost_using!(post, source)
        ActiveRecord::Base.transaction do
          micropost = Micropost.create provider_id: post['object_id'],
                                       provider_url: post['link'],
                                       text: post['message'],
                                       source: source,
                                       created_time: post['created_time'],
                                       status: MicropostStatus::PENDING

          attach_troller_to micropost, from: source
          attach_content_to micropost, from: post
        end
      end

      def attach_content_to(post, from:)
        Medium.create micropost: post,
                      remote_file_url: from['full_picture'],
                      kind: MediumKind.value_for(from['type']),
                      url: get_media_video(from['object_id'], from['type'])
      end

      def attach_troller_to(post, from:)
        post.trollers << Troller.new(trollerable: from.club)
      end

      def get_media_video(object_id, kind)
        "https://www.facebook.com/video/embed?video_id=#{object_id}" if kind == 'video'
      end
    end
  end
end
