# frozen_string_literal: true
module Searches
  class FacebookPageService
    class << self
      FIELDS = %w(id object_id message link created_time full_picture).freeze
      KEYS = "posts?fields=#{FIELDS.join(',')}".freeze

      def find_posts_for(source)
        last = source.last.try(&:provider_id)

        FacebookProvider.client.get_connections(source.key, KEYS).take(100)
                        .select { |e| e.key? 'object_id' }.each do |post|
          break if reached_limit? post['id'], last

          begin
            create_micropost_using!(post, source)
          rescue => e
            Rails.logger.info "--- ERROR at #{self}: #{e.message} ---\n"
          end
        end
      end

      private

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
          attach_content_to micropost
        end
      end

      def attach_content_to(post)
        Medium.create do |m|
          m.micropost = post
          m.remote_file_url = post['full_picture']
        end
      end

      def attach_troller_to(post, from:)
        post.trollers << Troller.new(trollerable: from.club)
      end
    end
  end
end
