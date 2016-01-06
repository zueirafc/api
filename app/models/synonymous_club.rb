class SynonymousClub < ActiveRecord::Base
  belongs_to :club

  validates :name, presence: true

  validates :club, presence: true
end
