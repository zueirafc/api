class Micropost < ActiveRecord::Base
  belongs_to :source
  belongs_to :user

  has_many :media
  has_many :targets
  has_many :trollers

  validates :provider_id, presence: true
  validates :shared, presence: true
  validates :text, presence: true

  has_enumeration_for :status, with: MicropostStatus, required: true
end
