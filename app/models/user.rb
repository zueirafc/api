class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :trackable,
         :validatable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  belongs_to :club

  # acts_as_authorization_subject

  validates :club, presence: true
  validates :username, presence: true, uniqueness: true
end
