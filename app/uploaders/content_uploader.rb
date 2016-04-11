class ContentUploader < BaseUploader
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
