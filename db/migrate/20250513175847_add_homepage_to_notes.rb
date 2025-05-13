class AddHomepageToNotes < ActiveRecord::Migration[8.0]
  def change
    add_reference :notes, :homepage, null: false, foreign_key: true
  end
end
