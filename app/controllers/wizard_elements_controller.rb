class WizardElementsController < ApplicationController
  def index
    @wizard_elements = WizardElement.all
  end

  def show
    @wizard_element = WizardElement.find(params[:id])
  end

  def new
    @wizard_element = WizardElement.new
    @wizard_element.wizard_id = params[:wizard_id]
  end

  def create
    @wizard_element = WizardElement.new(wizard_element_params)

    if @wizard_element.save
      redirect_to @wizard_element.wizard
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @wizard_element = WizardElement.find(params[:id])
  end

  def update
    @wizard_element = WizardElement.find(params[:id])

    if @wizard_element.update(wizard_element_params)
      redirect_to @wizard_element.wizard
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @wizard_element = WizardElement.find(params[:id])
    @wizard_element.destroy

    redirect_to wizard_elements_path, status: :see_other
  end

  private
  
  def wizard_element_params
    params.require(:wizard_element).permit(:wizard_id, :text, :question, :order)
  end
end
