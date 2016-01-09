class Contact < ActiveRecord::Base
  belongs_to :category, class_name: 'ContactCategory',
                        foreign_key: :contact_category_id

  validates :name, :email, :message, :category, presence: true

  has_enumeration_for :status, with: ContactStatus, required: true
end
