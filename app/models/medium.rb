class Medium < ActiveRecord::Base
  belongs_to :micropost, inverse_of: :media

  mount_base64_uploader :file, ContentUploader

  validates :micropost, presence: true
  validates :url, presence: true, if: :video?

  has_enumeration_for :kind, with: MediumKind, create_helpers: true,
                             create_scopes: true, required: true
end
