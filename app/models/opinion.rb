# frozen_string_literal: true

class Opinion < ApplicationRecord
  acts_as_votable

  validates :text, presence: true
  
  has_many :likes, dependent: :destroy
  belongs_to :user

  def user_fullname
    user.fullname
  end
end
