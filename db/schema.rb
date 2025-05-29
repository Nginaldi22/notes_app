# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_17_155003) do
  create_table "flashcards", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.integer "note_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_flashcards_on_note_id"
  end

  create_table "homepages", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "registration_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registration_id"], name: "index_homepages_on_registration_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "homepage_id", null: false
    t.index ["homepage_id"], name: "index_notes_on_homepage_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "flashcards", "notes"
  add_foreign_key "homepages", "registrations"
  add_foreign_key "notes", "homepages"
end
