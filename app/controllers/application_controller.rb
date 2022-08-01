class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :check_logged_in
  before_action :check_midas_admin

  def check_logged_in
    redirect_to login_path, notice: "Welcome to MIDAS, please log in first." unless logged_in?
  end

  def check_midas_admin
    redirect_to root_path unless is_midas_admin?
  end
end
