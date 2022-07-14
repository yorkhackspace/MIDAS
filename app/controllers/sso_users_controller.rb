class SsoUsersController < ApplicationController
  def new
    @sso_user = SsoUser.new(person: Person.find(params[:person_id]))
  end

  def create
    @sso_user = SsoUser.new(sso_user_params)

    if @sso_user.save
      redirect_to @sso_user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @sso_user = SsoUser.find(params[:id])
  end

  def edit
    @sso_user = SsoUser.find(params[:id])
  end

  def destroy
    @sso_user = SsoUser.find(params[:id])

    if session[:sso_user_id] == @sso_user.id
      redirect_to @sso_user, notice: "Cannot delete logged-in SSO User", status: :unprocessable_entity
    else
      person = @sso_user.person
      @sso_user.destroy

      redirect_to person, status: :see_other
    end
  end
  
  private

  def sso_user_params
    params.require(:sso_user).permit(:username, :password, :person_id)
  end
end
