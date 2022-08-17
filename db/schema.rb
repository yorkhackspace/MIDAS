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

ActiveRecord::Schema[7.0].define(version: 2022_08_17_175232) do
  create_table "emergency_contacts", force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "for_id", null: false
    t.string "relation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_emergency_contacts_on_contact_id"
    t.index ["for_id"], name: "index_emergency_contacts_on_for_id"
  end

  create_table "form_field_options", force: :cascade do |t|
    t.integer "form_field_id", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_field_id"], name: "index_form_field_options_on_form_field_id"
  end

  create_table "form_fields", force: :cascade do |t|
    t.integer "form_id", null: false
    t.string "name"
    t.string "description"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_fields_on_form_id"
  end

  create_table "form_fill_entries", force: :cascade do |t|
    t.integer "form_fill_id", null: false
    t.integer "form_field_id", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_field_id"], name: "index_form_fill_entries_on_form_field_id"
    t.index ["form_fill_id"], name: "index_form_fill_entries_on_form_fill_id"
  end

  create_table "form_fills", force: :cascade do |t|
    t.integer "filler_id", null: false
    t.integer "signer_id", null: false
    t.integer "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filler_id"], name: "index_form_fills_on_filler_id"
    t.index ["form_id"], name: "index_form_fills_on_form_id"
    t.index ["signer_id"], name: "index_form_fills_on_signer_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keysets", force: :cascade do |t|
    t.string "fob_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "keyset_id"
    t.index ["keyset_id"], name: "index_memberships_on_keyset_id"
    t.index ["person_id"], name: "index_memberships_on_person_id"
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
  end

  create_table "sso_user_authorisations", force: :cascade do |t|
    t.string "slug"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sso_user_authorisations_users", id: false, force: :cascade do |t|
    t.integer "sso_user_id", null: false
    t.integer "sso_user_authorisation_id", null: false
    t.index ["sso_user_authorisation_id"], name: "index_sso_user_authorisations_users_on_sso_user_authorisation_id"
    t.index ["sso_user_id"], name: "index_sso_user_authorisations_users_on_sso_user_id"
  end

  create_table "sso_users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_sso_users_on_person_id"
  end

  create_table "wizard_completions", force: :cascade do |t|
    t.integer "signer_id", null: false
    t.integer "signee_id", null: false
    t.integer "wizard_id", null: false
    t.boolean "needs_review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["signee_id"], name: "index_wizard_completions_on_signee_id"
    t.index ["signer_id"], name: "index_wizard_completions_on_signer_id"
    t.index ["wizard_id"], name: "index_wizard_completions_on_wizard_id"
  end

  create_table "wizard_elements", force: :cascade do |t|
    t.integer "wizard_id", null: false
    t.text "text"
    t.boolean "question"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wizard_id"], name: "index_wizard_elements_on_wizard_id"
  end

  create_table "wizards", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "sso_user_authorisation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sso_user_authorisation_id"], name: "index_wizards_on_sso_user_authorisation_id"
  end

  add_foreign_key "emergency_contacts", "persons", column: "contact_id"
  add_foreign_key "emergency_contacts", "persons", column: "for_id"
  add_foreign_key "form_field_options", "form_fields"
  add_foreign_key "form_fields", "forms"
  add_foreign_key "form_fill_entries", "form_fields"
  add_foreign_key "form_fill_entries", "form_fills"
  add_foreign_key "form_fills", "forms"
  add_foreign_key "form_fills", "persons", column: "filler_id"
  add_foreign_key "form_fills", "persons", column: "signer_id"
  add_foreign_key "memberships", "keysets"
  add_foreign_key "memberships", "persons"
  add_foreign_key "notes", "persons", column: "noter_id"
  add_foreign_key "sso_users", "persons"
  add_foreign_key "wizard_completions", "persons", column: "signee_id"
  add_foreign_key "wizard_completions", "persons", column: "signer_id"
  add_foreign_key "wizard_completions", "wizards"
  add_foreign_key "wizard_elements", "wizards"
  add_foreign_key "wizards", "sso_user_authorisations"
end
