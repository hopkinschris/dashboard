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

ActiveRecord::Schema.define(version: 20131013171153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calories", force: true do |t|
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moods", force: true do |t|
    t.string   "title"
    t.integer  "sub_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "moods", ["user_id"], name: "index_moods_on_user_id", using: :btree

  create_table "pulses", force: true do |t|
    t.integer  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sleeps", force: true do |t|
    t.integer  "light_sleep"
    t.integer  "deep_sleep"
    t.integer  "quality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: true do |t|
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "age"
    t.string   "gender"
    t.string   "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weights", force: true do |t|
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
