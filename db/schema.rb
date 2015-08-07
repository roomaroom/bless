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

ActiveRecord::Schema.define(version: 20150807081638) do

  create_table "activities", force: true do |t|
    t.text     "body"
    t.integer  "type"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "profile_id", null: false
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activities", ["item_id"], name: "index_activities_on_item_id"
  add_index "activities", ["item_type"], name: "index_activities_on_item_type"
  add_index "activities", ["owner_id"], name: "index_activities_on_owner_id"
  add_index "activities", ["profile_id"], name: "index_activities_on_profile_id"

  create_table "albums", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "profile_id"
    t.integer  "pryvacy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["profile_id"], name: "index_albums_on_profile_id"
  add_index "albums", ["pryvacy_id"], name: "index_albums_on_pryvacy_id"

  create_table "friends", force: true do |t|
    t.integer  "status",     default: 0
    t.integer  "friend_id"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friends", ["friend_id"], name: "index_friends_on_friend_id"
  add_index "friends", ["profile_id"], name: "index_friends_on_profile_id"

  create_table "photos", force: true do |t|
    t.text     "description"
    t.integer  "profile_id"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "photos", ["album_id"], name: "index_photos_on_album_id"
  add_index "photos", ["profile_id"], name: "index_photos_on_profile_id"

  create_table "posts", force: true do |t|
    t.text     "title"
    t.text     "body"
    t.integer  "profile_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["profile_id"], name: "index_posts_on_profile_id"

  create_table "privacies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "status",     default: "welcome"
    t.string   "city"
    t.string   "avatar"
    t.string   "state"
    t.datetime "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "shares", force: true do |t|
    t.integer  "shared_profile_id"
    t.integer  "shared_activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shares", ["shared_activity_id"], name: "index_shares_on_shared_activity_id"
  add_index "shares", ["shared_profile_id"], name: "index_shares_on_shared_profile_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
