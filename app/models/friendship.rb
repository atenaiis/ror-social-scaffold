class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  has_many :posts, class_name: 'Post', foreign_key: 'user_id'
end
