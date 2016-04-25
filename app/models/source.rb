class Source < ActiveRecord::Base
  belongs_to :target, class_name: 'Club'
  belongs_to :troller, class_name: 'Club'

  has_many :microposts

  validates :name, :key, presence: true

  has_enumeration_for :kind, with: SourceKind, required: true
  has_enumeration_for :status, with: CommonStatus, required: true,
                               create_scopes: true

  def last
    microposts.reorder(id: :asc).last
  end
end
