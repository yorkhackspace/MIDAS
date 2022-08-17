class WizardCompletionsController < ApplicationController
  def index
    @wizard_completions = WizardCompletion.all
  end

  def show
    @wizard_completion = WizardCompletion.find(params[:id])
  end

  def new
    @wizard_completion = WizardCompletion.new
    @wizard_completion.wizard_id = params[:wizard_id]
    @wizard_completion.signer = current_user.person
  end

  def create
    @wizard_completion = WizardCompletion.new(wizard_completion_params)

    if @wizard_completion.save
      redirect_to @wizard_completion
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @wizard_completion = WizardCompletion.find(params[:id])
  end

  def update
    @wizard_completion = WizardCompletion.find(params[:id])

    if @wizard_completion.update(wizard_completion_params)
      redirect_to @wizard_completion
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @wizard_completion = WizardCompletion.find(params[:id])
    signee = @wizard_completion.signee
    @wizard_completion.destroy

    redirect_to signee, status: :see_other
  end

  private
  
  def wizard_completion_params
    params.require(:wizard_completion).permit(:signer_id, :signee_id, :wizard_id, :needs_review)
  end
end
