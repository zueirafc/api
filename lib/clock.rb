# rubocop:disable Metrics/LineLength
paths = ['config/boot', 'config/environment', 'app/models/source.rb', 'app/services/searches/base_service.rb']

paths.each { |path| require File.expand_path("../../#{path}", __FILE__) }

require 'clockwork'

include Clockwork

every 2.minutes do
  ActiveRecord::Base.connection_pool.with_connection do
    Source.active.each do |source|
      Search::Base.new(source).start_finder!
    end
  end
end
