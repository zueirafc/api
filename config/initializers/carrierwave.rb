# NullStorage provider for CarrierWave for use in tests.  Doesn't actually
# upload or store files but allows test to pass as if files were stored and
# the use of fixtures.
class NullStorage
  attr_reader :uploader

  def initialize(uploader)
    @uploader = uploader
  end

  def identifier
    uploader.filename
  end

  def store!(_file)
    true
  end

  def retrieve!(_identifier)
    true
  end
end

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['S3_ACCESS_KEY'],
    aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
    region:                'us-west-1',
    path_style: true
  }
  config.fog_directory = ENV['S3_BUCKET_NAME']

  if Rails.env.production?
    config.storage = :fog
  else
    config.storage NullStorage
    config.enable_processing = false
  end
end
