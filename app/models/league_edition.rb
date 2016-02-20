class LeagueEdition < ActiveRecord::Base
  belongs_to :league
  belongs_to :champion, class_name: 'Club', foreign_key: :champion_id

  has_many :participants
  has_many :clubs, through: :participants

  validates :league, presence: true
  validates :edition_at, presence: true

  has_enumeration_for :status, with: LeagueEditionStatus, required: true
end
