class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  belongs_to :club

  # acts_as_authorization_subject

  mount_base64_uploader :image, ProfileImageUploader

  validates :club, presence: true, unless: :facebook?
  validates :username, presence: true, uniqueness: true

  before_save :generate_username, on: :create

  private

  def facebook?
    provider.eql? 'facebook'
  end

  def generate_username
    self.username = email[/[^@]+/]
  end
end
