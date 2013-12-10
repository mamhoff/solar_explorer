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

ActiveRecord::Schema.define(version: 20131209151725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boats", force: true do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "booking_statuses", force: true do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookings", force: true do |t|
    t.integer  "captain_id"
    t.integer  "guide_id"
    t.integer  "boat_id"
    t.integer  "tour_id"
    t.string   "customer_name",     limit: 50
    t.string   "customer_email",    limit: 50
    t.integer  "booking_status_id"
    t.text     "contact_info"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookings", ["boat_id"], name: "index_bookings_on_boat_id", using: :btree
  add_index "bookings", ["booking_status_id"], name: "index_bookings_on_booking_status_id", using: :btree
  add_index "bookings", ["captain_id"], name: "index_bookings_on_captain_id", using: :btree
  add_index "bookings", ["customer_email"], name: "index_bookings_on_customer_email", using: :btree
  add_index "bookings", ["customer_name"], name: "index_bookings_on_customer_name", using: :btree
  add_index "bookings", ["guide_id"], name: "index_bookings_on_guide_id", using: :btree
  add_index "bookings", ["tour_id"], name: "index_bookings_on_tour_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "roles_users", force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "tours", force: true do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wishes", force: true do |t|
    t.datetime "fromtime"
    t.datetime "totime"
    t.integer  "booking_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wishes", ["booking_id"], name: "index_wishes_on_booking_id", using: :btree

end
