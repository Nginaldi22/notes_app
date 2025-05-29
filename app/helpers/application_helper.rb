module ApplicationHelper
  def inside_note_context?
    params[:note_id].present? || (params[:controller] == "notes" && params[:id].present?)
  end
  def inside_flashcard_context?
    params[:flashcard_id].present? || (params[:controller] == "flashcards" && params[:id].present?)
  end
end
