# rubocop:disable Metrics/LineLength
paths = ['config/boot', 'config/environment', 'app/models/source.rb', 'app/services/searches/base_service.rb']

paths.each { |path| require File.expand_path("../../#{path}", __FILE__) }

require 'clockwork'
include Clockwork

handler do |job, time|
  Rails.logger.info "------- Running #{job}, at #{time} -------"
end

every 3.hours, 'Microposts Finder' do
  ActiveRecord::Base.connection_pool.with_connection do
    Source.active.each do |source|
      Searches::BaseService.new(source).start_finder!
    end
  end
end
