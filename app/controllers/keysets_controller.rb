class KeysetsController < ApplicationController
  def index
    @keysets = Keyset.all
  end

  def show
    @keyset = Keyset.find(params[:id])
    @return = params[:return]
  end

  def new
    @keyset = Keyset.new
  end

  def create
    @keyset = Keyset.new(keyset_params)

    if @keyset.save
      redirect_to @keyset
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @keyset = Keyset.find(params[:id])
  end

  def update
    @keyset = Keyset.find(params[:id])

    if @keyset.update(keyset_params)
      redirect_to @keyset
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @keyset = Keyset.find(params[:id])
    @keyset.destroy

    redirect_to keysets_path, status: :see_other
  end

  private
  
  def keyset_params
    params.require(:keyset).permit(:fob_number)
  end
end
