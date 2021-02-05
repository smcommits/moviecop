# frozen_string_literal: true

class FollowingsController < ApplicationController
  def create
    user = User.find(params[:id])
    current_user.users_they_followed.create(followed_id: user.id)
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:id])
    instance = current_user.follow_instance(user)
    instance&.destroy
    redirect_to user_path(user)
  end
end
