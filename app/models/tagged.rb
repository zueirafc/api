class Tagged < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :tag
end
