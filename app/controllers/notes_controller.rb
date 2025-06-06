class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to homepage_show_path(current_user.id), notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_path(@note), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy!

    respond_to do |format|
      format.html { redirect_to homepage_show_path(current_user.id), status: :see_other, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end
def upload_form
  @note = Note.find(params[:id])
end
  def upload_documents
  @note = Note.find(params[:id])
  if params[:note][:documents]
    @note.documents.attach(params[:note][:documents])
    redirect_to note_path(@note), notice: "Documents uploaded!"
  else
    redirect_to note_path(@note), alert: "Please select files to upload."
  end
  end

  def delete_document
  @note = Note.find(params[:id])
   document = @note.documents.find { |doc| doc.id.to_s == params[:document_id].to_s }
  document.purge

  redirect_to note_path(@note), notice: "Document deleted successfully."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
  params.require(:note).permit(:title, :homepage_id)
    end
end
