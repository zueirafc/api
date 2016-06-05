class ContentUploader < BaseUploader
  process quality: 60

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    "file.#{file.extension}"
  end
end
