class ContentUploader < BaseUploader
  process quality: 60

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    # "file_#{('a'..'z').to_a.shuffle[0, 10].join}.#{file.extension}"
    "file_#{model.id}.#{file.extension}"
  end
end
