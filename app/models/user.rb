class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :fullname, presence: true

  has_many :users_they_followed, class_name: "Following", foreign_key: :follower_id
  has_many :followings, through: :users_they_followed, source: :followed

  has_many :following_users, class_name: "Following", foreign_key: :followed_id
  has_many :followers, through: :following_users

  has_many :opinions
  has_many :opinion_followings, through: :followings, source: :opinions




end
