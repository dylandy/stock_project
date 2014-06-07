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

ActiveRecord::Schema.define(version: 20140607111434) do

  create_table "item_tables", force: true do |t|
    t.string  "name"
    t.float   "prev_close"
    t.float   "bid"
    t.float   "ask"
    t.float   "open"
    t.float   "close"
    t.float   "high"
    t.float   "low"
    t.integer "volume"
    t.string  "item_id",    null: false
  end

  create_table "selections", force: true do |t|
    t.integer "userid"
    t.integer "itemid"
  end

  create_table "users", force: true do |t|
    t.string   "account"
    t.string   "pwd"
    t.integer  "kind",                   limit: 1
    t.integer  "status",                 limit: 1
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
