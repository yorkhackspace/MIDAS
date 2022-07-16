class MembershipsController < ApplicationController
  def index
    @memberships = Memberships.all
  end

  def show
    @membership = Membership.find(params[:id])
  end

  def new
    @membership = Membership.new(person_id: params[:person_id],
                                 status: params[:status])
  end

  def create
    @membership = Membership.new(membership_params)

    if @membership.save
      redirect_to @membership
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @membership = Membership.find(params[:id])
  end

  def update
    @membership = Membership.find(params[:id])

    if @membership.update(membership_params)
      redirect_to @membership
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    person = @membership.person
    @membership.destroy

    redirect_to person, status: :see_other
  end

  private
  
  def membership_params
    params.require(:membership).permit(:person_id, :status)
  end
end
