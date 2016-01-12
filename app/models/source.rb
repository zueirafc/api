class Source < ActiveRecord::Base
  belongs_to :club
  has_many :microposts

  validates :name, :key, presence: true

  has_enumeration_for :kind, with: SourceKind, required: true
  has_enumeration_for :status, with: CommonStatus, required: true

  delegate :last, to: :microposts
end
