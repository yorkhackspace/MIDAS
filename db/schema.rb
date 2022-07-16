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

ActiveRecord::Schema[7.0].define(version: 2022_07_16_121524) do
  create_table "emergency_contacts", force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "for_id", null: false
    t.string "relation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_emergency_contacts_on_contact_id"
    t.index ["for_id"], name: "index_emergency_contacts_on_for_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "body"
    t.integer "noter_id", null: false
    t.string "notable_type", null: false
    t.integer "notable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable"
    t.index ["noter_id"], name: "index_notes_on_noter_id"
  end

  create_table "persons", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "telephone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "member"
  end

  create_table "sso_users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_sso_users_on_person_id"
  end

  add_foreign_key "emergency_contacts", "persons", column: "contact_id"
  add_foreign_key "emergency_contacts", "persons", column: "for_id"
  add_foreign_key "notes", "persons", column: "noter_id"
  add_foreign_key "sso_users", "persons"
end
