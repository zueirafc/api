class MicropostSerializer < ActiveModel::Serializer
  attributes :id, :user, :source, :text, :all_targets, :all_trollers,
             :status, :shared, :is_shared, :created_at, :updated_at,
             :provider_id, :provider_url, :title, :trollers

  has_many :targets, serializer: TargetSerializer
end
