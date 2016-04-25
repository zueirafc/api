class TargetSerializer < ActiveModel::Serializer
  attributes :id, :targetable_id, :targetable_type, :club_name,
             :club_shield

  def club_name
    object.targetable.short_name
  end

  def club_shield
    object.targetable.shield_url
  end
end
