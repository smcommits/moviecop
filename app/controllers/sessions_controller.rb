class SessionsController < ApplicationController
  skip_before_action :require_login!, only: [:new, :create]

  def new
  end
  def create
    if user = User.find_by_username(params[:username])
      session[:current_user_id] = user.id
      redirect_to user_path(id: user.id)
    else
      flash[:alert] = 'Username Not Found!'
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)
    @_current_user = nil
    redirect_to login_path
  end

end
