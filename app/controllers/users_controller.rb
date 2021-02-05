# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login!, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User has been created!'
      redirect_to login_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if params.key?(:photo)
      if current_user.photo.attach(params[:photo])
        flash[:success] = params
        redirect_to user_path(id: current_user.id)
      end
    else
      if current_user.coverimage.attach(params[:coverimage])
        flash[:success] = 'Cover Image Changed Successfully'
        redirect_to user_path(id: current_user.id)
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :coverimage)
  end
end
