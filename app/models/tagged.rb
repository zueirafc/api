class Tagged < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :synonymous_club

  validates :micropost, presence: true
  validates :synonymous_club, presence: true
end
