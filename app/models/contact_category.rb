class ContactCategory < ActiveRecord::Base
  has_many :contacts, dependent: :restrict_with_error

  validates :name, presence: true
  validates :email, presence: true

  has_enumeration_for :status, with: CommonStatus, required: true,
                               create_helpers: true, create_scopes: true

  default_scope { order(:name) }
end
