class ShieldUploader < BaseUploader
  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :medium do
    process resize_to_fit: [200, 200]
    process quality: 60
  end

  def filename
    "club-#{model.short_name.downcase.tr(' ', '_')}.#{file.extension}"
  end
end
