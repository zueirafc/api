class ContentUploader < BaseUploader
  process quality: 60

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    "file_#{('a'..'z').to_a.sample(10).join}.#{file.extension}"
  end
end
