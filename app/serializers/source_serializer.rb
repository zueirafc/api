class SourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :key, :kind, :status, :root_url, :troller, :target

  delegate :root_url, to: :object
end
