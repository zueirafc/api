class PostReference < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :referenceable, polymorphic: true

  validates :micropost, presence: true
  validates :referenceable, presence: true
end
