class NicknameFanSerializer < ActiveModel::Serializer
  attributes :id, :name, :plural, :status, :club_id, :club_initials

  def club_id
    object.club.id
  end

  def club_initials
    object.club.initials
  end
end
