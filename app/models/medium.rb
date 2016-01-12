class Medium < ActiveRecord::Base
  belongs_to :micropost

  mount_base64_uploader :file, ContentUploader

  validates :micropost, presence: true
end
