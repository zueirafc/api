class Troller < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :trollerable, polymorphic: true

  validates :micropost, :trollerable, presence: true
  # validates :micropost_id, uniqueness: { scope: :trollerable }

  def self.valid_ones
    { clubs: Club.all, leagues: LeagueEdition.all }
  end
end
