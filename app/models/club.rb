class Club < ActiveRecord::Base
  has_many :sources
  has_many :targets
  has_many :trollers

  mount_base64_uploader :shield, ShieldUploader

  validates :full_name, presence: true
  validates :short_name, presence: true
  validates :shield, presence: true
end
