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

ActiveRecord::Schema.define(version: 2021_12_06_195146) do

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "date"
    t.string "sport"
    t.string "location"
    t.integer "current_players"
    t.integer "max_players"
    t.text "description"
    t.integer "host_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["host_id"], name: "index_games_on_host_id"
  end

  create_table "participants", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_participants_on_game_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email"
    t.string "city"
    t.string "profile_pic"
    t.string "password_digest"
    t.string "password_confirmation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "games", "users", column: "host_id"
  add_foreign_key "participants", "games"
  add_foreign_key "participants", "users"
end
