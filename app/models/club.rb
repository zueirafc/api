class Club < ActiveRecord::Base
  has_many :troller_sources, class_name: 'Source', foreign_key: :troller_id
  has_many :target_sources, class_name: 'Source', foreign_key: :target_id
  has_many :nickname_fans

  has_many :trollers, as: :trollerable
  has_many :targets, as: :targetable

  mount_base64_uploader :shield, ShieldUploader

  validates :full_name, presence: true
  validates :short_name, presence: true
  validates :shield, presence: true

  default_scope { order(:short_name) }
end
