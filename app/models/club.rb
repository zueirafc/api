class Club < ActiveRecord::Base
  validates :full_name, presence: true
  validates :short_name, presence: true
  validates :shield, presence: true
end
