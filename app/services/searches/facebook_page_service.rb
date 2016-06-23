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
          post = generate_new_by(data, source)

          attach_clubs_to post, from: source
          attach_content_to post, from: data

          post.save!
        end
      end

      def generate_new_by(data, source)
        source.microposts.create! do |p|
          p.provider_id = data['object_id']
          p.provider_url = data['link']
          p.text = data['message']
          p.created_time = data['created_time']
          p.status = MicropostStatus::ACTIVE
        end
      end

      def attach_content_to(post, from:)
        post.media << Medium.new(remote_file_url: from['full_picture'],
                                 kind: MediumKind.value_for(from['type']),
                                 url: from['link'])
      end

      def attach_clubs_to(post, from:)
        troller = from.troller
        target = from.target

        post.trollers << Troller.new(trollerable: troller) if troller.present?
        post.targets << Target.new(targetable: target) if target.present?
      end
    end
  end
end
