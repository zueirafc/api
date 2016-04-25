class MediaSerializer < ActiveModel::Serializer
  attributes :id, :file, :url, :kind

  def file
    object.file_url
  end
end
