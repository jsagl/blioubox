# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_10_162652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.string "brewery_name"
    t.string "brewery_url"
    t.string "brewery_country"
    t.string "brewery_city"
    t.text "description"
    t.float "abv"
    t.integer "ibu"
    t.string "logo_url"
    t.string "beer_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "bid"
    t.integer "external_brewery_id"
    t.index ["bid"], name: "index_beers_on_bid"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "beer_id", null: false
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_favorites_on_beer_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "beers"
  add_foreign_key "favorites", "users"
end
