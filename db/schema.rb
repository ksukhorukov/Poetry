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

ActiveRecord::Schema.define(version: 20160608144230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "poems", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.string   "metaphor"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poems_tags", force: :cascade do |t|
    t.integer "poem_id"
    t.integer "tag_id"
  end

  add_index "poems_tags", ["poem_id"], name: "index_poems_tags_on_poem_id", using: :btree
  add_index "poems_tags", ["tag_id"], name: "index_poems_tags_on_tag_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string  "name"
    t.text    "biography"
    t.integer "user_id"
  end

  create_table "short_stories", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.string   "short_description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "short_stories_tags", force: :cascade do |t|
    t.integer "short_story_id"
    t.integer "tag_id"
  end

  add_index "short_stories_tags", ["short_story_id"], name: "index_short_stories_tags_on_short_story_id", using: :btree
  add_index "short_stories_tags", ["tag_id"], name: "index_short_stories_tags_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.text     "biography"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
