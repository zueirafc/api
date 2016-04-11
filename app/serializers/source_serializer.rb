class SourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :key, :kind, :status, :root_url, :troller_id,
             :target_id

  delegate :root_url, to: :object
end
