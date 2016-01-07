class Micropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :source

  has_many :media
  has_many :targets
  has_many :trollers

  validates :text, :shared, :user, presence: true

  has_enumeration_for :status, with: MicropostStatus, required: true
end
