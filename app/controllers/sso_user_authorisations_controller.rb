class SsoUserAuthorisationsController < ApplicationController
  def index
    @sso_user_authorisations = SsoUserAuthorisation.all
  end

  def show
    @sso_user_authorisation = SsoUserAuthorisation.find(params[:id])
  end

  def new
    @sso_user_authorisation = SsoUserAuthorisation.new
  end

  def create
    @sso_user_authorisation = SsoUserAuthorisation.new(sso_user_authorisation_params)

    if @sso_user_authorisation.save
      redirect_to @sso_user_authorisation
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @sso_user_authorisation = SsoUserAuthorisation.find(params[:id])
  end

  def update
    @sso_user_authorisation = SsoUserAuthorisation.find(params[:id])

    if @sso_user_authorisation.update(sso_user_authorisation_params)
      redirect_to @sso_user_authorisation
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sso_user_authorisation = SsoUserAuthorisation.find(params[:id])
    @sso_user_authorisation.destroy

    redirect_to sso_user_authorisations_path, status: :see_other
  end

  private
  
  def sso_user_authorisation_params
    params.require(:sso_user_authorisation).permit(:slug, :description)
  end
end
