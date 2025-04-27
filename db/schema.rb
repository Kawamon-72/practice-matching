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

ActiveRecord::Schema[8.0].define(version: 2025_04_24_111240) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

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

  create_table "practice_matches", force: :cascade do |t|
    t.date "schedule"
    t.text "place"
    t.integer "number_of_accept"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_practice_matches_on_user_id"
  end

  create_table "practice_matches_cities", force: :cascade do |t|
    t.bigint "practice_match_id", null: false
    t.bigint "city_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_tag_id"], name: "index_practice_matches_cities_on_city_tag_id"
    t.index ["practice_match_id"], name: "index_practice_matches_cities_on_practice_match_id"
  end

  create_table "practice_matches_prefectures", force: :cascade do |t|
    t.bigint "practice_match_id", null: false
    t.bigint "prefecture_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["practice_match_id"], name: "index_practice_matches_prefectures_on_practice_match_id"
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

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "practice_matches", "users"
  add_foreign_key "practice_matches_cities", "city_tags"
  add_foreign_key "practice_matches_cities", "practice_matches"
  add_foreign_key "practice_matches_prefectures", "practice_matches"
  add_foreign_key "practice_matches_prefectures", "prefecture_tags"
  add_foreign_key "profile_genre_generations", "genre_generation_tags"
  add_foreign_key "profile_genre_generations", "profiles"
  add_foreign_key "profile_sports", "profiles"
  add_foreign_key "profile_sports", "sports_tags"
end
