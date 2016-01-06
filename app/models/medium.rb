class Medium < ActiveRecord::Base
  belongs_to :micropost
  # TODO: add a uploader here!

  has_enumeration_for :kind, with: MediumKind, required: true
end
