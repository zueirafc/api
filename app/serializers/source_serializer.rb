class SourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :key, :kind, :status, :club_id
end
