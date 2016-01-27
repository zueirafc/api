class TargetSerializer < ActiveModel::Serializer
  attributes :id, :targetable_id, :targetable_type
end
