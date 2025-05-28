class FlashcardsController < ApplicationController
  before_action :set_flashcard, only: %i[ show edit update destroy ]
  def new
     @note = Note.find(params[:note_id])
    @flashcard = @note.flashcards.new
  end
  def create
    @note = Note.find(params[:note_id])
  @flashcard = @note.flashcards.new(flashcard_params)
  if @flashcard.save
    redirect_to note_path(@note), notice: "Flashcard created successfully."
  else
    render :new
  end
  end
  def show
  end
  def edit
  end
  def update
    if @flashcard.update(flashcard_params)
    redirect_to note_flashcard_path(@note, @flashcard), notice: "Flashcard was successfully updated."
    else
    render :edit
    end
  end
  def destroy
    @flashcard.destroy
  redirect_to note_path(@note), notice: "Flashcard was successfully deleted."
  end
  private
  def set_flashcard
    @note = Note.find(params[:note_id])
    @flashcard = Note.find(params[:note_id]).flashcards.find(params[:id])
  end
  def flashcard_params
    params.require(:flashcard).permit(:title, :text)
  end
end
