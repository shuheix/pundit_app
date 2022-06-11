# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_11_200737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_notes", comment: "アカウントとノートの中間テーブル", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "note_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id", "note_id"], name: "index_account_notes_on_account_id_and_note_id", unique: true
    t.index ["account_id"], name: "index_account_notes_on_account_id"
    t.index ["note_id"], name: "index_account_notes_on_note_id"
  end

  create_table "accounts", comment: "accountのテーブル", force: :cascade do |t|
    t.string "name", comment: "名前"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_accounts_on_name", unique: true
  end

  create_table "notes", comment: "ノート", force: :cascade do |t|
    t.string "title", comment: "タイトル"
    t.text "content", comment: "内容"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "account_notes", "accounts"
  add_foreign_key "account_notes", "notes"
end
