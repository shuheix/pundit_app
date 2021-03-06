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

ActiveRecord::Schema.define(version: 2022_06_19_191146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_groups", comment: "アカウントとグループの中間テーブル", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id", "group_id"], name: "index_account_groups_on_account_id_and_group_id", unique: true
    t.index ["account_id"], name: "index_account_groups_on_account_id"
    t.index ["group_id"], name: "index_account_groups_on_group_id"
  end

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
    t.string "name", null: false, comment: "名前"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "password_digest"
    t.index ["name"], name: "index_accounts_on_name", unique: true
  end

  create_table "accounts_roles", id: false, force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "role_id"
    t.index ["account_id", "role_id"], name: "index_accounts_roles_on_account_id_and_role_id"
    t.index ["account_id"], name: "index_accounts_roles_on_account_id"
    t.index ["role_id"], name: "index_accounts_roles_on_role_id"
  end

  create_table "companies", comment: "会社", force: :cascade do |t|
    t.string "name", null: false, comment: "会社名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_companies_on_name"
  end

  create_table "company_accounts", comment: "会社とアカウントの中間テーブル", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id", "company_id"], name: "index_company_accounts_on_account_id_and_company_id", unique: true
    t.index ["account_id"], name: "index_company_accounts_on_account_id"
    t.index ["company_id"], name: "index_company_accounts_on_company_id"
  end

  create_table "groups", comment: "グループ", force: :cascade do |t|
    t.string "name", null: false, comment: "グループ名"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_groups_on_company_id"
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "notes", comment: "ノート", force: :cascade do |t|
    t.string "title", comment: "タイトル"
    t.text "content", comment: "内容"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id", null: false
    t.bigint "group_id"
    t.bigint "account_id"
    t.boolean "is_archived", default: false, comment: "archiveされているか"
    t.index ["account_id"], name: "index_notes_on_account_id"
    t.index ["company_id"], name: "index_notes_on_company_id"
    t.index ["group_id"], name: "index_notes_on_group_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  add_foreign_key "account_groups", "accounts"
  add_foreign_key "account_groups", "groups"
  add_foreign_key "account_notes", "accounts"
  add_foreign_key "account_notes", "notes"
  add_foreign_key "company_accounts", "accounts"
  add_foreign_key "company_accounts", "companies"
  add_foreign_key "groups", "companies"
  add_foreign_key "notes", "accounts"
  add_foreign_key "notes", "companies"
  add_foreign_key "notes", "groups"
end
