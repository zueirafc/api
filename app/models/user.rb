class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  belongs_to :club

  # acts_as_authorization_subject

  mount_base64_uploader :image, ProfileImageUploader

  validates :club, presence: true, unless: :facebook?
  validates :username, presence: true, uniqueness: true

  after_initialize :generate_username

  private

  def facebook?
    provider.eql? 'facebook'
  end

  def generate_username
    self.username = email[/[^@]+/]
  end
end
