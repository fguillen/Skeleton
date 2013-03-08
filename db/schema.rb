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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130308104037) do

  create_table "admin_users", :force => true do |t|
    t.string   "name",              :null => false
    t.string   "email",             :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "perishable_token"
  end

  add_index "admin_users", ["perishable_token"], :name => "index_admin_users_on_perishable_token"

  create_table "items", :force => true do |t|
    t.string   "title",      :null => false
    t.text     "text"
    t.integer  "position",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pics", :force => true do |t|
    t.integer  "item_id",             :null => false
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.integer  "position",            :null => false
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
