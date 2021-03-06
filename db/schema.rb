# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151113134528) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "name",              limit: 255, null: false
    t.string   "email",             limit: 255, null: false
    t.string   "crypted_password",  limit: 255
    t.string   "password_salt",     limit: 255
    t.string   "persistence_token", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token",  limit: 255
  end

  add_index "admin_users", ["perishable_token"], name: "index_admin_users_on_perishable_token"

  create_table "items", force: :cascade do |t|
    t.string   "title",      limit: 255, null: false
    t.text     "text"
    t.integer  "position",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "log_book_events", force: :cascade do |t|
    t.integer  "historian_id"
    t.string   "historian_type",    limit: 255
    t.integer  "historizable_id"
    t.string   "historizable_type", limit: 255
    t.text     "text",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pics", force: :cascade do |t|
    t.integer  "item_id",                         null: false
    t.string   "attach_file_name",    limit: 255
    t.string   "attach_content_type", limit: 255
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.integer  "position",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255, null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id"
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count",             default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

end
