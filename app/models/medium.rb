class Medium < ActiveRecord::Base
  belongs_to :micropost

  mount_base64_uploader :file, ContentUploader

  validates :micropost, presence: true

  has_enumeration_for :kind, with: MediumKind, create_helpers: true,
                             create_scopes: true, required: true
end
