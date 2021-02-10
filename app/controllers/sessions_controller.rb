class SessionsController < ApplicationController
  skip_before_action :require_login!, only: %i[new create]

  def new; end

  def create
    user = User.find_by_username(params[:username])
    if user
      session[:current_user_id] = user.id
      redirect_to root_path
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
