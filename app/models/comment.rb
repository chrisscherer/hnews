class Comment < ActiveRecord::Base
  belongs_to_one :user
  belongs_to_one :post
  # Remember to create a migration!
end
