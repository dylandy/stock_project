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

ActiveRecord::Schema.define(version: 20140519104529) do

  create_table "item_tables", force: true do |t|
    t.string  "name"
    t.float   "prev_close"
    t.float   "bid"
    t.float   "ask"
    t.float   "open"
    t.float   "close"
    t.float   "high"
    t.float   "low"
    t.integer "volumn"
    t.integer "item_id",    null: false
  end

  create_table "selections", force: true do |t|
    t.integer "userid"
    t.integer "itemid"
  end

  create_table "users", force: true do |t|
    t.string  "account"
    t.string  "pwd"
    t.integer "kind"
  end

end
