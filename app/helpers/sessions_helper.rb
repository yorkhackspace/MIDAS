module SessionsHelper
  def logged_in?
    !!session[:sso_user_id]
  end

  def current_user
    SsoUser.find_by_id(session[:sso_user_id]) if logged_in?
  end

  def is_midas_user?(sso_user = current_user)
    sso_user.sso_user_authorisations.map(&:slug).include?("midas_user")
  end

  def is_midas_admin?(sso_user = current_user)
    sso_user.sso_user_authorisations.map(&:slug).include?("midas_admin")
  end
end
