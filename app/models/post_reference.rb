class PostReference < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :user

  validates :micropost, presence: true
  validates :user, presence: true
end
