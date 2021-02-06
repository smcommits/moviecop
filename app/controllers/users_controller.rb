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
    @user = User.includes([:photo_attachment]).find(params[:id])
  end

  def update
    if params.key?(:photo)
      if current_user.photo.attach(params[:photo])
        redirect_to user_path(id: current_user.id)
      end
    elsif current_user.coverimage.attach(params[:coverimage])
      redirect_to user_path(id: current_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :coverimage)
  end
end
