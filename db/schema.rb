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

ActiveRecord::Schema.define(version: 20150819140810) do

  create_table "activities", force: :cascade do |t|
    t.text     "body"
    t.integer  "type"
    t.integer  "item_id"
    t.string   "item_type"
    t.boolean  "shared",                   default: false
    t.integer  "profile_id",                               null: false
    t.integer  "wall_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "draft_comments_count",     default: 0
    t.integer  "published_comments_count", default: 0
    t.integer  "deleted_comments_count",   default: 0
  end

  add_index "activities", ["item_id"], name: "index_activities_on_item_id"
  add_index "activities", ["item_type"], name: "index_activities_on_item_type"
  add_index "activities", ["profile_id"], name: "index_activities_on_profile_id"
  add_index "activities", ["wall_id"], name: "index_activities_on_wall_id"

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "profile_id"
    t.integer  "pryvacy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["profile_id"], name: "index_albums_on_profile_id"
  add_index "albums", ["pryvacy_id"], name: "index_albums_on_pryvacy_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "holder_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "commentable_url"
    t.string   "commentable_title"
    t.string   "commentable_state"
    t.string   "anchor"
    t.string   "title"
    t.string   "contacts"
    t.text     "raw_content"
    t.text     "content"
    t.string   "view_token"
    t.string   "state",             default: "draft"
    t.string   "ip",                default: "undefined"
    t.string   "referer",           default: "undefined"
    t.string   "user_agent",        default: "undefined"
    t.integer  "tolerance_time"
    t.boolean  "spam",              default: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",             default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "conversations", ["receiver_id"], name: "index_conversations_on_receiver_id"
  add_index "conversations", ["sender_id"], name: "index_conversations_on_sender_id"

  create_table "follows", force: :cascade do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows"

  create_table "friends", force: :cascade do |t|
    t.integer  "status",     default: 0
    t.integer  "friend_id"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friends", ["friend_id"], name: "index_friends_on_friend_id"
  add_index "friends", ["profile_id"], name: "index_friends_on_profile_id"

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables"
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes"

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables"
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions"

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "profile_id"
    t.boolean  "sender_deleted",   default: false
    t.boolean  "receiver_deleted", default: false
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["profile_id"], name: "index_messages_on_profile_id"

  create_table "photos", force: :cascade do |t|
    t.text     "description"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "draft_comments_count",     default: 0
    t.integer  "published_comments_count", default: 0
    t.integer  "deleted_comments_count",   default: 0
  end

  add_index "photos", ["imageable_id"], name: "index_photos_on_imageable_id"

  create_table "post_images", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_images", ["photo_id"], name: "index_post_images_on_photo_id"
  add_index "post_images", ["post_id"], name: "index_post_images_on_post_id"

  create_table "posts", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.integer  "profile_id"
    t.integer  "wall_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["profile_id"], name: "index_posts_on_profile_id"
  add_index "posts", ["wall_id"], name: "index_posts_on_wall_id"

  create_table "privacies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: :cascade do |t|
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

  create_table "shares", force: :cascade do |t|
    t.integer  "shared_profile_id"
    t.integer  "shared_activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shares", ["shared_activity_id"], name: "index_shares_on_shared_activity_id"
  add_index "shares", ["shared_profile_id"], name: "index_shares_on_shared_profile_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                       default: "", null: false
    t.string   "encrypted_password",          default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "my_draft_comments_count",     default: 0
    t.integer  "my_published_comments_count", default: 0
    t.integer  "my_comments_count",           default: 0
    t.integer  "draft_comcoms_count",         default: 0
    t.integer  "published_comcoms_count",     default: 0
    t.integer  "deleted_comcoms_count",       default: 0
    t.integer  "spam_comcoms_count",          default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
