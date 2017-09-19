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

ActiveRecord::Schema.define(version: 20170919195704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "duties", force: :cascade do |t|
    t.date "date"
    t.bigint "room_id"
    t.integer "slots"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_duties_on_room_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["room_id"], name: "index_members_on_room_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "picks", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "duty_id"
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["duty_id"], name: "index_picks_on_duty_id"
    t.index ["member_id"], name: "index_picks_on_member_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "title"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
    t.bigint "picking_member_id"
    t.bigint "moderator_id"
    t.index ["moderator_id"], name: "index_rooms_on_moderator_id"
    t.index ["picking_member_id"], name: "index_rooms_on_picking_member_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "duties", "rooms"
  add_foreign_key "members", "rooms"
  add_foreign_key "picks", "duties"
  add_foreign_key "picks", "members"
end
