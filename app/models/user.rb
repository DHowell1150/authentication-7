# models/user.rb
class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :confirmation_password

  has_secure_password
end