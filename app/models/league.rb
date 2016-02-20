class League < ActiveRecord::Base
  has_many :editions, class_name: 'LeagueEdition'

  validates :name, presence: true
  validates :country, presence: true

  has_enumeration_for :status, with: CommonStatus, required: true
end
