class ContentUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
