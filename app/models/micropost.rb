class Micropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :source

  validates :text, :shared, :user, presence: true

  has_enumeration_for :status, with: MicropostStatus, required: true
end
