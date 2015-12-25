class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable # , :omniauthable

  belongs_to :club

  acts_as_authorization_subject

  validates :club, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates :username, presence: true, uniqueness: true
end
