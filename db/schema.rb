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

ActiveRecord::Schema.define(version: 20141122233902) do

  create_table "airports", force: true do |t|
    t.string   "code"
    t.string   "cc_fips"
    t.string   "name"
    t.decimal  "lat"
    t.decimal  "long"
    t.decimal  "fixed_fare"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "role"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookings", force: true do |t|
    t.integer  "user_id"
    t.integer  "supplier_id"
    t.integer  "vehicletype_id"
    t.string   "booking_number"
    t.integer  "airport_id"
    t.string   "status"
    t.string   "booking_type"
    t.string   "arrival_airline"
    t.string   "arrival_flight_number"
    t.string   "arrival_fliyng_from"
    t.datetime "arrival_date"
    t.string   "departure_airlines"
    t.string   "departure_flight_number"
    t.datetime "departure_date"
    t.datetime "arrival_pick_up_time"
    t.datetime "departure_pick_up_time"
    t.decimal  "price"
    t.string   "arrival_address_line_1"
    t.string   "arrival_address_line_2"
    t.string   "departure_address_line_1"
    t.string   "departure_address_line_2"
    t.integer  "passengers"
    t.integer  "baggages"
    t.integer  "hand_laggages"
    t.integer  "baby"
    t.integer  "child"
    t.string   "booster"
    t.string   "special_requirements"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destination_fares", force: true do |t|
    t.integer  "vehicletype_id"
    t.integer  "destination_id"
    t.decimal  "dest_fare"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destinations", force: true do |t|
    t.integer  "airport_id"
    t.string   "name"
    t.string   "address"
    t.string   "address_description"
    t.time     "avg_duration_min"
    t.decimal  "distance"
    t.decimal  "lat"
    t.decimal  "long"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "currency"
    t.decimal  "amount"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "payment_system"
    t.integer  "user_id"
  end

  create_table "reviews", force: true do |t|
    t.string   "name"
    t.string   "language"
    t.string   "review"
    t.boolean  "show"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "image_link"
  end

  create_table "suppliers", force: true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.string   "currency"
    t.decimal  "amount"
    t.string   "description"
    t.string   "operation"
    t.string   "inquiry_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.string   "role"
    t.string   "phone"
    t.string   "countrycode"
    t.datetime "last_seen_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "oauth_link"
    t.string   "oauth_link_image"
    t.string   "invitation_token"
    t.boolean  "subscription"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "vehicletypes", force: true do |t|
    t.string   "vtype"
    t.string   "vdescription"
    t.string   "image"
    t.integer  "passnum"
    t.integer  "bagagenum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
