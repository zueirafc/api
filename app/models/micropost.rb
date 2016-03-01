class Micropost < ActiveRecord::Base
  belongs_to :source
  belongs_to :user

  has_many :media, dependent: :destroy
  has_many :targets, dependent: :destroy
  has_many :trollers, dependent: :destroy

  validates :provider_id, presence: true
  validates :shared, presence: true
  validates :text, presence: true

  accepts_nested_attributes_for :targets
  accepts_nested_attributes_for :trollers

  has_enumeration_for :status, with: MicropostStatus, required: true,
                               create_scopes: true, create_helpers: true
end
