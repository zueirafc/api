class ApiKey < ActiveRecord::Base
  before_create :generate_access_token

  private

  def generate_access_token
    loop do
      self.access_token = SecureRandom.hex(32)

      break unless self.class.exists?(access_token: access_token)
    end
  end
end
