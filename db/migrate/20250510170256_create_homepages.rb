class CreateHomepages < ActiveRecord::Migration[8.0]
  def change
    create_table :homepages do |t|
      t.string :title
      t.text :description
      t.references :registration, null: false, foreign_key: true

      t.timestamps
    end
  end
end
