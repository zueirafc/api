class Target < ActiveRecord::Base
  attr_accessor :test

  belongs_to :micropost
  belongs_to :targetable, polymorphic: true

  validates :micropost, :targetable, presence: true

  scope :clubs, -> { where(targetable_type: 'Club') }

  def self.valid_ones
    { clubs: Club.all, leagues: LeagueEdition.all }
  end
end
