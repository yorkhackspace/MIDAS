module SessionsHelper
  def logged_in?
    !!session[:sso_user_id]
  end

  def current_user
    @current_user ||= SsoUser.find_by_id(session[:sso_user_id]) if logged_in?
  end
end
