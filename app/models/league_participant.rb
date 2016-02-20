class LeagueParticipant < ActiveRecord::Base
  belongs_to :club
  belongs_to :edition, class_name: 'LeagueEdition', foreign_key: :edition_id

  validates :club, presence: true
  validates :edition, presence: true
end
