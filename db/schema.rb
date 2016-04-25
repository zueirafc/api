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

ActiveRecord::Schema.define(version: 20160425133652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string "access_token", limit: 255, null: false
  end

  add_index "api_keys", ["access_token"], name: "index_api_keys_on_access_token", using: :btree

  create_table "clubs", force: :cascade do |t|
    t.string "shield"
    t.string "official_website"
    t.string "official_facebook_page"
    t.string "official_twitter_page"
    t.string "short_name"
    t.string "full_name"
    t.string "initials"
  end

  create_table "contact_categories", force: :cascade do |t|
    t.string  "name",   null: false
    t.integer "status", null: false
  end

  add_index "contact_categories", ["status"], name: "index_contact_categories_on_status", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "email",               null: false
    t.string   "name",                null: false
    t.integer  "status",              null: false
    t.text     "message",             null: false
    t.integer  "contact_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "contacts", ["contact_category_id"], name: "index_contacts_on_contact_category_id", using: :btree
  add_index "contacts", ["email"], name: "index_contacts_on_email", using: :btree
  add_index "contacts", ["status"], name: "index_contacts_on_status", using: :btree

  create_table "league_editions", force: :cascade do |t|
    t.date     "edition_at"
    t.integer  "status"
    t.integer  "league_id"
    t.integer  "champion_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "league_editions", ["champion_id"], name: "index_league_editions_on_champion_id", using: :btree
  add_index "league_editions", ["league_id"], name: "index_league_editions_on_league_id", using: :btree

  create_table "league_participants", force: :cascade do |t|
    t.integer "club_id"
    t.integer "edition_id"
  end

  add_index "league_participants", ["club_id"], name: "index_league_participants_on_club_id", using: :btree
  add_index "league_participants", ["edition_id"], name: "index_league_participants_on_edition_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "name",       limit: 60, null: false
    t.string   "country",    limit: 60, null: false
    t.integer  "status",                null: false
    t.string   "codename"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "leagues", ["status"], name: "index_leagues_on_status", using: :btree

  create_table "media", force: :cascade do |t|
    t.string   "file"
    t.integer  "micropost_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "kind",         default: 2
    t.string   "url"
  end

  add_index "media", ["kind"], name: "index_media_on_kind", using: :btree
  add_index "media", ["micropost_id"], name: "index_media_on_micropost_id", using: :btree

  create_table "microposts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "source_id"
    t.text     "text",                                         null: false
    t.boolean  "all_targets",  default: false,                 null: false
    t.boolean  "all_trollers", default: false,                 null: false
    t.integer  "status",       default: 0,                     null: false
    t.integer  "shared",       default: 0
    t.boolean  "is_shared",    default: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "provider_id",                                  null: false
    t.string   "provider_url"
    t.string   "title"
    t.datetime "created_time", default: '2016-04-11 14:48:35'
  end

  add_index "microposts", ["provider_id", "source_id"], name: "index_microposts_on_provider_id_and_source_id", unique: true, using: :btree
  add_index "microposts", ["source_id"], name: "index_microposts_on_source_id", using: :btree
  add_index "microposts", ["status"], name: "index_microposts_on_status", using: :btree
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

  create_table "nickname_fans", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "plural"
    t.integer  "status"
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "nickname_fans", ["club_id"], name: "index_nickname_fans_on_club_id", using: :btree
  add_index "nickname_fans", ["status"], name: "index_nickname_fans_on_status", using: :btree

  create_table "post_references", force: :cascade do |t|
    t.integer  "micropost_id"
    t.integer  "referenceable_id"
    t.string   "referenceable_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "post_references", ["micropost_id"], name: "index_post_references_on_micropost_id", using: :btree
  add_index "post_references", ["referenceable_id", "referenceable_type"], name: "idx_post_references_as_polimorphic_referenceable", using: :btree

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

  create_table "sources", force: :cascade do |t|
    t.string  "name",       null: false
    t.string  "key",        null: false
    t.integer "kind",       null: false
    t.integer "status",     null: false
    t.integer "troller_id"
    t.string  "root_url"
    t.integer "target_id"
  end

  add_index "sources", ["kind"], name: "index_sources_on_kind", using: :btree
  add_index "sources", ["status"], name: "index_sources_on_status", using: :btree
  add_index "sources", ["target_id"], name: "index_sources_on_target_id", using: :btree
  add_index "sources", ["troller_id"], name: "index_sources_on_troller_id", using: :btree

  create_table "synonymous_clubs", force: :cascade do |t|
    t.integer "club_id"
    t.string  "name"
  end

  add_index "synonymous_clubs", ["club_id"], name: "index_synonymous_clubs_on_club_id", using: :btree

  create_table "taggeds", force: :cascade do |t|
    t.integer  "micropost_id"
    t.integer  "synonymous_club_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "taggeds", ["micropost_id"], name: "index_taggeds_on_micropost_id", using: :btree
  add_index "taggeds", ["synonymous_club_id"], name: "index_taggeds_on_synonymous_club_id", using: :btree

  create_table "targets", force: :cascade do |t|
    t.integer  "micropost_id"
    t.integer  "targetable_id"
    t.string   "targetable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "targets", ["micropost_id"], name: "index_targets_on_micropost_id", using: :btree
  add_index "targets", ["targetable_type", "targetable_id"], name: "index_targets_on_targetable_type_and_targetable_id", using: :btree

  create_table "trollers", force: :cascade do |t|
    t.integer  "micropost_id"
    t.integer  "trollerable_id"
    t.string   "trollerable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "trollers", ["micropost_id"], name: "index_trollers_on_micropost_id", using: :btree
  add_index "trollers", ["trollerable_type", "trollerable_id"], name: "index_trollers_on_trollerable_type_and_trollerable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.string   "image"
    t.integer  "club_id"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "users", ["club_id"], name: "index_users_on_club_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "contacts", "contact_categories"
  add_foreign_key "league_editions", "clubs", column: "champion_id"
  add_foreign_key "league_editions", "leagues"
  add_foreign_key "league_participants", "clubs"
  add_foreign_key "league_participants", "league_editions", column: "edition_id"
  add_foreign_key "media", "microposts"
  add_foreign_key "microposts", "sources"
  add_foreign_key "microposts", "users"
  add_foreign_key "nickname_fans", "clubs"
  add_foreign_key "post_references", "microposts"
  add_foreign_key "sources", "clubs", column: "target_id"
  add_foreign_key "sources", "clubs", column: "troller_id"
  add_foreign_key "synonymous_clubs", "clubs"
  add_foreign_key "taggeds", "microposts"
  add_foreign_key "taggeds", "synonymous_clubs"
  add_foreign_key "targets", "microposts"
  add_foreign_key "trollers", "microposts"
  add_foreign_key "users", "clubs"
end
