class MediaSerializer < ActiveModel::Serializer
  attributes :id, :file

  def file
    object.file_url
  end
end
