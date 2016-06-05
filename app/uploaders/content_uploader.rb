class ContentUploader < BaseUploader
  process quality: 60

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    "file_#{Time.now.to_i}.#{file.extension}"
  end
end
