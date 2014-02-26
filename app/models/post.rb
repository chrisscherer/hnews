class Post < ActiveRecord::Base
  has_many :comments
  # has_many :commenters through :comments, :class_name => "User"
  has_one :author, :class_name => "User"
  # Remember to create a migration!
  validates :title, :presence => true
  validates :url, :presence => true
end
