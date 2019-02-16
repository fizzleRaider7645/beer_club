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

ActiveRecord::Schema.define(version: 2019_02_16_200124) do

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.float "abv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "style"
    t.string "brewery"
  end

  create_table "medals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medals_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "medal_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "beer_id"
    t.date "date"
    t.float "rating"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "status", default: 0
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
