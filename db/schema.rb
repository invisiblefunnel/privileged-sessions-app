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

ActiveRecord::Schema.define(version: 20131027000809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "privileged_sessions", force: true do |t|
    t.integer  "user_id"
    t.string   "key",        null: false
    t.datetime "revoked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "privileged_sessions", ["key"], name: "index_privileged_sessions_on_key", unique: true, using: :btree
  add_index "privileged_sessions", ["user_id"], name: "index_privileged_sessions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
