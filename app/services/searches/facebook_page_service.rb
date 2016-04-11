module Searches
  class FacebookPageService
    class << self
      def find_posts_for(source)
        last = source.last.try(&:provider_id)

        FacebookProvider.client.get_connections(source.key, KEYS)
                        .select { |e| e.key? 'object_id' }.each do |post|
          condition = breakers post['object_id'], last, source

          next if condition.eql? 1
          break if condition.eql? 0

          create_micropost_using!(post, source)
        end
      end

      private

      FIELDS = %w(id object_id message link created_time
                  full_picture type).freeze
      KEYS = "posts?fields=#{FIELDS.join(',')}".freeze

      def breakers(id, last, source)
        if reached_limit?(id, last)
          0
        elsif Micropost.exists?(source: source, provider_id: id)
          1
        end
      end

      def reached_limit?(id, last)
        id.to_s.eql?(last)
      end

      def create_micropost_using!(data, source)
        ActiveRecord::Base.transaction do
          post = Micropost.create provider_id: data['object_id'],
                                  provider_url: data['link'],
                                  text: data['message'],
                                  source: source,
                                  created_time: data['created_time'],
                                  status: MicropostStatus::PENDING

          attach_clubs_to post, from: source
          attach_content_to post, from: data
        end
      end

      def attach_content_to(post, from:)
        Medium.create micropost: post,
                      remote_file_url: from['full_picture'],
                      kind: MediumKind.value_for(from['type']),
                      url: get_media_video(from['object_id'], from['type'])
      end

      def attach_clubs_to(post, from:)
        post.trollers << Troller.new(trollerable: from.troller)
        post.targets << Target.new(targetable: from.target)
      end

      def get_media_video(object_id, kind)
        return nil unless kind.eql? 'video'

        "https://www.facebook.com/video/embed?video_id=#{object_id}"
      end
    end
  end
end
