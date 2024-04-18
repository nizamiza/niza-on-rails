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

ActiveRecord::Schema[7.1].define(version: 2024_04_18_211951) do
  create_table "access_requests", force: :cascade do |t|
    t.integer "kind"
    t.string "name"
    t.string "email"
    t.string "message"
    t.string "approval_token"
    t.integer "access_token_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token_id"], name: "index_access_requests_on_access_token_id"
    t.index ["approval_token"], name: "index_access_requests_on_approval_token", unique: true
  end

  create_table "access_tokens", force: :cascade do |t|
    t.integer "kind"
    t.string "token"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_access_tokens_on_token", unique: true
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string "address"
    t.string "phone"
    t.string "email"
    t.json "social_links"
    t.json "languages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "access_requests", "access_tokens"
end
