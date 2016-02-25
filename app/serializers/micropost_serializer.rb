class MicropostSerializer < ActiveModel::Serializer
  attributes :id, :user, :source, :text, :all_targets, :all_trollers,
             :status, :shared, :is_shared, :created_time, :updated_at,
             :provider_id, :provider_url, :title, :trollers, :media

  has_many :targets, serializer: TargetSerializer
  has_many :media, serializer: MediaSerializer
end
