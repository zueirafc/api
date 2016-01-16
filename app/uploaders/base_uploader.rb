class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
