class User < ApplicationRecord
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }, on: :create
  validates :password, presence: true, length: { minimum: 6 }
  validates_confirmation_of :password

  has_many :messages

  def self.authenticate(email, password)
    user =  find_by_email(email)
    user if user && user.password == password
  end
end
