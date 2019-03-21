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

ActiveRecord::Schema.define(version: 2019_03_21_133937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basic_informations", force: :cascade do |t|
    t.integer "user_id"
    t.string "firstname"
    t.string "lastname"
    t.string "profile_pic"
    t.string "birthday"
    t.text "address"
    t.string "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remove_profile_pic"
  end

  create_table "basic_informations_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "basic_information_id", null: false
    t.index ["basic_information_id"], name: "index_basic_informations_users_on_basic_information_id"
    t.index ["user_id"], name: "index_basic_informations_users_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "user2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "name_and_profile_pictures", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.string "prefer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "preferences_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "preference_id", null: false
    t.index ["preference_id"], name: "index_preferences_users_on_preference_id"
    t.index ["user_id"], name: "index_preferences_users_on_user_id"
  end

  create_table "swipes", force: :cascade do |t|
    t.integer "swipee"
    t.boolean "direction"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_swipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "preference_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mobile_number"], name: "index_users_on_mobile_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "matches", "users"
  add_foreign_key "swipes", "users"
end
