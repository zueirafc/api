class NicknameFan < ActiveRecord::Base
  belongs_to :club

  validates :club, presence: true
  validates :name, presence: true

  has_enumeration_for :status, with: CommonStatus, required: true,
                               create_scopes: true, create_helpers: true

  after_initialize :pluralize_name, on: :create

  default_scope { order(:name) }

  private

  def pluralize_name
    self.plural = name.pluralize if name.present? && plural.nil?
  end
end
