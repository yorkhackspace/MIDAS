class WizardsController < ApplicationController
  def index
    @wizards = Wizard.all
  end

  def show
    @wizard = Wizard.find(params[:id])
  end

  def new
    @wizard = Wizard.new
  end

  def create
    @wizard = Wizard.new(wizard_params)

    if @wizard.save
      redirect_to @wizard
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @wizard = Wizard.find(params[:id])
  end

  def update
    @wizard = Wizard.find(params[:id])

    if @wizard.update(wizard_params)
      redirect_to @wizard
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @wizard = Wizard.find(params[:id])
    @wizard.destroy

    redirect_to wizards_path, status: :see_other
  end

  def review_all_completions
    wizard = Wizard.find(params[:id])
    wizard.wizard_completions.update_all(needs_review: true)

    redirect_to wizard
  end

  private
  
  def wizard_params
    params.require(:wizard).permit(:name, :description, :sso_user_authorisation_id)
  end
end
