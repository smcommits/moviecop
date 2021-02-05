class Opinion < ApplicationRecord
  acts_as_votable

  validates :text, presence: { message: "Woops! Empty opinion won't make a differnce" }

  has_many :likes, dependent: :destroy
  belongs_to :user

  def user_fullname
    user.fullname
  end
end
