class Opinion < ApplicationRecord
  validates :text, presence: true;

  belongs_to :user

  def user_fullname
    user.fullname
  end
end
