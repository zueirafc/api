class Micropost < ActiveRecord::Base
  belongs_to :source
  belongs_to :user

  has_many :media, dependent: :destroy
  has_many :targets, dependent: :destroy
  has_many :trollers, dependent: :destroy

  has_many :troller_clubs,
           through: :trollers, source: :trollerable, source_type: 'Club'
  has_many :target_clubs,
           through: :targets, source: :targetable, source_type: 'Club'

  validates :provider_id, presence: true
  validates :shared, presence: true
  validates :text, presence: true

  accepts_nested_attributes_for :targets
  accepts_nested_attributes_for :trollers

  has_enumeration_for :status, with: MicropostStatus, required: true,
                               create_scopes: true, create_helpers: true

  default_scope -> { order(updated_at: :desc) }

  ##
  # Public: Get only posts based on nickname fan of a club as troller.
  scope :troller_microposts_from_nick, lambda { |nick|
    joins(:trollers).where(trollers: { trollerable: nick.club })
  }

  ##
  # Public: Get only posts based on nickname fan of a club as target.
  scope :target_microposts_from_nick, lambda { |nick|
    joins(:targets).where(targets: { targetable: nick.club })
  }

  ##
  # Public: Get posts based on nickname fans according of your type
  #        (troller/target).
  scope :versus_microposts_from_nicks, lambda { |troller, target|
    troller_microposts_from_nick(troller).target_microposts_from_nick(target)
  }
end
