class Contact < ActiveRecord::Base
  belongs_to :category, class_name: 'ContactCategory',
                        foreign_key: :contact_category_id

  validates :category, presence: true

  validates :email, presence: true
  validates :message, presence: true
  validates :name, presence: true

  has_enumeration_for :status, with: ContactStatus, required: true,
                               create_helpers: true
end
