class Medium < ActiveRecord::Base
  belongs_to :micropost
  # TODO: add a uploader here!
  validates :micropost, presence: true

  has_enumeration_for :kind, with: MediumKind, required: true
end
