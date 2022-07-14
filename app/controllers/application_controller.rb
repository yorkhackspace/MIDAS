class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :check_logged_in

  def check_logged_in
    redirect_to login_path, notice: "Welcome to MIDAS, please log in first." unless logged_in?
  end
end
