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

ActiveRecord::Schema.define(version: 2018_05_23_061415) do

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loads", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "amount_loaded"
    t.integer "remaining_load"
    t.bigint "user_id"
    t.bigint "transport_fare_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transport_fare_id"], name: "index_loads_on_transport_fare_id"
    t.index ["user_id"], name: "index_loads_on_user_id"
  end

  create_table "transport_fares", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "pickup_location"
    t.string "drop_location"
    t.integer "trip_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "pickup_location"
    t.string "drop_location"
    t.integer "trip_amount"
    t.bigint "user_id"
    t.bigint "transport_fare_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transport_fare_id"], name: "index_trip_transactions_on_transport_fare_id"
    t.index ["user_id"], name: "index_trip_transactions_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "username"
    t.string "password_digest"
    t.string "password_confirmation"
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
  end

  add_foreign_key "loads", "transport_fares"
  add_foreign_key "loads", "users"
  add_foreign_key "trip_transactions", "transport_fares"
  add_foreign_key "trip_transactions", "users"
end
