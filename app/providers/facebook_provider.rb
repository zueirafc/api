module FacebookProvider
  attr_reader :client

  def self.client
    @client ||= Koala::Facebook::API.new ENV['FACEBOOK_ACCESS_TOKEN'],
                                         ENV['FACEBOOK_APP_SECRET']
  end
end
