class CreateFlashcards < ActiveRecord::Migration[8.0]
  def change
    create_table :flashcards do |t|
      t.string :title
      t.string :text
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end
  end
end
