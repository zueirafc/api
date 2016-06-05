class ClubSerializer < ActiveModel::Serializer
  attributes :id, :official_website, :shield, :official_facebook_page,
             :official_twitter_page, :short_name, :full_name, :initials,
             :quantity

  def quantity
    scope[:quantity] if scope.present?
  end
end
