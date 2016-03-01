module FacebookProvider
  attr_reader :client

  def self.client
    key = "#{ENV['FACEBOOK_APP_ID']}|#{ENV['FACEBOOK_APP_SECRET']}"

    @client ||= Koala::Facebook::API.new(key)
  end
end
