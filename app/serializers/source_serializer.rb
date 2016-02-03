class SourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :key, :kind, :status, :root_url, :club_id
end
