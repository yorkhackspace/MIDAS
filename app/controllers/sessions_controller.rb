class SessionsController < ApplicationController
  skip_before_action :check_logged_in, only: [:login, :create]
  skip_before_action :check_midas_admin

  def login
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    @sso_user = SsoUser.find_by(username: params[:username])

    if !!@sso_user && @sso_user.authenticate(params[:password]) && is_midas_user?(@sso_user)
      session[:sso_user_id] = @sso_user.id
      redirect_to root_path
    else
      redirect_to login_path, notice: "Login Error"
    end
  end

  def destroy
    session.delete(:sso_user_id)
    redirect_to login_path, notice: "Logged out"
  end
end
