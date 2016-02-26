class Target < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :targetable, polymorphic: true

  validates :micropost, :targetable, presence: true

  def self.valid_ones
    { clubs: Club.all, leagues: LeagueEdition.all }
  end
end
