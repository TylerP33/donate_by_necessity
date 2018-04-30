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

ActiveRecord::Schema.define(version: 2018_04_30_204119) do

  create_table "categories", force: :cascade do |t|
    t.integer "toilet_paper"
    t.integer "dental_hygiene"
    t.integer "first_aid"
    t.integer "general_hygiene"
    t.integer "underwear_socks"
    t.integer "blankets"
    t.integer "school_supplies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "diapers"
  end

  create_table "donors", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "recipients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.string "gender"
    t.text "personal_notes"
    t.string "urgent_needs"
    t.integer "donor_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
