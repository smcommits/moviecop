class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :fullname, presence: true

  has_many :users_they_followed, class_name: "Following", foreign_key: :follower_id
  has_many :followings, through: :users_they_followed, source: :followed

  has_many :following_users, class_name: "Following", foreign_key: :followed_id
  has_many :followers, through: :following_users

  has_many :opinions
  has_many :opinion_followings, through: :followings, source: :opinions

  has_one_attached :photo
  has_one_attached :coverimage

 def following_count
    followings.count
  end

  def followers_count
    followers.count
  end

  def self.authenticate(username: nil)
    User.find_by_username(username)
  end

  def opinions_from_followings
    opinion_followings.includes([:user]).order(created_at: :desc)
  end

  def following?(user)
    followings.include?(user)
  end

  def not_following
    User.all.includes([:photo_attachment]).excluding(followings, self).sort_by(&:created_at).reverse!
  end

  def opinions_count
    opinions.count
  end

  def followings_count
    followings.count
  end

  def followers_count
    followers.count
  end

  def current_user?
    self == current_user
  end

  def photo_attached?
    photo.attached?
  end

  def follow_instance(user)
    follow = users_they_followed.where('followed_id = ?', user.id)
    follow.take
  end


end
