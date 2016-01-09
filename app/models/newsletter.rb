class Newsletter < ActiveRecord::Base
  validates :email, presence: true

  has_enumeration_for :status, with: CommonStatus, required: true
end
