class UsersController < ApplicationController
  
  skip_before_action :require_login!, only: [:new, :create]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User has been created!"
      redirect_to login_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id]);
  end

  def update
    if current_user.photo.attach(params[:photo])
      flash[:success] = 'Image Uploaded Successfully'
      redirect_to root_path
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :fullname, :photo)
  end

 
end
