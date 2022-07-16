class NotesController < ApplicationController
  def index
    @notes = Notes.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new(noter: current_user.person,
                     notable_id: params[:notable_id],
                     notable_type: params[:notable_type])
  end

  def create
    @note = Note.new(notes_params)

    if @note.save
      redirect_to @note.notable
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(notes_params)
      redirect_to @note.notable
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    notable = @note.notable
    @note.destroy

    redirect_to notable, status: :see_other
  end

  private
  
    def notes_params
      params.require(:note).permit(:noter_id, :notable_id, :notable_type, :body)
    end
end
