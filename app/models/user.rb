require 'bcrypt'

class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  validates :password, :presence => true
  validates :user_name, :presence => true

  has_secure_password
  # Remember to create a migration!

  def self.authenticate(user_name, password)
    user = User.where(user_name: user_name).first
    user.authenticate(password) if user
  end
end
