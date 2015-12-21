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

ActiveRecord::Schema.define(version: 20151221124422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "shield"
    t.string "official_website"
    t.string "official_facebook_page"
    t.string "official_twitter_page"
    t.string "short_name"
    t.string "full_name"
    t.string "initials"
  end

  create_table "microposts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

  create_table "post_references", force: :cascade do |t|
    t.integer  "micropost_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "post_references", ["micropost_id"], name: "index_post_references_on_micropost_id", using: :btree
  add_index "post_references", ["user_id"], name: "index_post_references_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string  "name",                              null: false
    t.string  "authorizable_type"
    t.integer "authorizable_id"
    t.boolean "system",            default: false, null: false
  end

  add_index "roles", ["authorizable_type", "authorizable_id"], name: "index_roles_on_authorizable_type_and_authorizable_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "taggeds", force: :cascade do |t|
    t.integer  "micropost_id"
    t.integer  "tag_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "taggeds", ["micropost_id"], name: "index_taggeds_on_micropost_id", using: :btree
  add_index "taggeds", ["tag_id"], name: "index_taggeds_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.integer "club_id"
    t.string  "name"
  end

  add_index "tags", ["club_id"], name: "index_tags_on_club_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "name"
    t.string   "password"
    t.string   "image"
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["club_id"], name: "index_users_on_club_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "microposts", "users"
  add_foreign_key "post_references", "microposts"
  add_foreign_key "post_references", "users"
  add_foreign_key "taggeds", "microposts"
  add_foreign_key "taggeds", "tags"
  add_foreign_key "tags", "clubs"
  add_foreign_key "users", "clubs"
end
