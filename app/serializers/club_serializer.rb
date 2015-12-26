class ClubSerializer < ActiveModel::Serializer
  attributes :id, :official_website, :shield_url, :official_facebook_page,
             :official_twitter_page, :short_name, :full_name, :initials

  def shield_url
    object.shield_url
  end
end