class User < ActiveRecord::Base
  belongs_to :club

  acts_as_authorization_subject
end
