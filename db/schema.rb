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

ActiveRecord::Schema.define(version: 20170308090309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "latitude",   precision: 10, scale: 6
    t.decimal  "longitude",  precision: 10, scale: 6
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id"], name: "index_locations_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              null: false
    t.string   "encrypted_password", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "users_conversations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_users_conversations_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_users_conversations_on_user_id", using: :btree
  end

  create_table "users_games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.index ["game_id"], name: "index_users_games_on_game_id", using: :btree
    t.index ["user_id"], name: "index_users_games_on_user_id", using: :btree
  end

end
