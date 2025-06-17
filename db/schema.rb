# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_09_110338) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.bigint "chat_room_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_chat_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.bigint "practice_match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["practice_match_id"], name: "index_chat_rooms_on_practice_match_id"
  end

  create_table "city_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genre_generation_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "practice_match_id", null: false
    t.integer "like_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "liked_user_id"
    t.index ["liked_user_id"], name: "index_likes_on_liked_user_id"
    t.index ["practice_match_id"], name: "index_likes_on_practice_match_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "visitor_id", null: false
    t.bigint "visited_id", null: false
    t.bigint "practice_match_id", null: false
    t.string "action"
    t.boolean "checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["practice_match_id"], name: "index_notifications_on_practice_match_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
  end

  create_table "practice_matches", force: :cascade do |t|
    t.date "schedule"
    t.text "place"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_practice_matches_on_user_id"
  end

  create_table "practice_matches_cities", force: :cascade do |t|
    t.bigint "practice_matche_id", null: false
    t.bigint "city_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_tag_id"], name: "index_practice_matches_cities_on_city_tag_id"
    t.index ["practice_matche_id"], name: "index_practice_matches_cities_on_practice_matche_id"
  end

  create_table "practice_matches_prefectures", force: :cascade do |t|
    t.bigint "practice_matche_id", null: false
    t.bigint "prefecture_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["practice_matche_id"], name: "index_practice_matches_prefectures_on_practice_matche_id"
    t.index ["prefecture_tag_id"], name: "index_practice_matches_prefectures_on_prefecture_tag_id"
  end

  create_table "prefecture_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_genre_generations", force: :cascade do |t|
    t.integer "profile_id", null: false
    t.integer "genre_generation_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_sports", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "sports_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "location"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
  end

  create_table "sports_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_practice_matches", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "practice_match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["practice_match_id"], name: "index_user_practice_matches_on_practice_match_id"
    t.index ["user_id"], name: "index_user_practice_matches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "chat_messages", "chat_rooms"
  add_foreign_key "chat_messages", "users"
  add_foreign_key "chat_rooms", "practice_matches"
  add_foreign_key "likes", "practice_matches"
  add_foreign_key "likes", "users"
  add_foreign_key "likes", "users", column: "liked_user_id"
  add_foreign_key "notifications", "practice_matches"
  add_foreign_key "notifications", "users", column: "visited_id"
  add_foreign_key "notifications", "users", column: "visitor_id"
  add_foreign_key "practice_matches", "users"
  add_foreign_key "practice_matches_cities", "city_tags"
  add_foreign_key "practice_matches_cities", "practice_matches", column: "practice_matche_id"
  add_foreign_key "practice_matches_prefectures", "practice_matches", column: "practice_matche_id"
  add_foreign_key "practice_matches_prefectures", "prefecture_tags"
  add_foreign_key "profile_genre_generations", "genre_generation_tags"
  add_foreign_key "profile_genre_generations", "profiles"
  add_foreign_key "profile_sports", "profiles"
  add_foreign_key "profile_sports", "sports_tags"
  add_foreign_key "user_practice_matches", "practice_matches"
  add_foreign_key "user_practice_matches", "users"
end
