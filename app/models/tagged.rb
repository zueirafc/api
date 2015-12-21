class Tagged < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :tag

  validates :micropost, presence: true
  validates :tag, presence: true
end
