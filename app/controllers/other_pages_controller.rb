class OtherPagesController < ApplicationController
  skip_before_action :check_midas_admin, only: [:dashboard]

  def dashboard
    @person = current_user.person
  end

  def admin
    unless is_midas_admin?
      redirect_to root_path
    end
  end
end
