require 'bcrypt'

class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  has_secure_password
  # Remember to create a migration!
end
