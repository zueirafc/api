class Troller < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :trollerable, polymorphic: true

  validates :micropost, :trollerable, presence: true

  def self.valid_ones
    { clubs: Club.all, leagues: LeagueEdition.all }
  end
end
