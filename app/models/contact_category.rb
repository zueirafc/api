class ContactCategory < ActiveRecord::Base
  has_many :contacts

  validates :name, presence: true

  has_enumeration_for :status, with: CommonStatus, required: true
end
