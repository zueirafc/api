class Target < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :targetable, polymorphic: true

  validates :micropost, :targetable, presence: true

  scope :clubs, -> { where(targetable_type: 'Club') }

  scope :most_ones, lambda {
    select('targetable_type, targetable_id, SUM(targetable_id) as t')
      .group(:targetable_type, :targetable_id).order('t DESC')
  }

  def self.valid_ones
    { clubs: Club.all, leagues: LeagueEdition.all }
  end
end
