class SourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :key, :kind, :status, :root_url, :club_id

  def root_url
    object.root_url
  end
end
