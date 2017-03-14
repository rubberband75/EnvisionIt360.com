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

ActiveRecord::Schema.define(version: 20160304180311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "community_builder_links", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "community_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "community_builder_links", ["community_id"], name: "index_community_builder_links_on_community_id", using: :btree
  add_index "community_builder_links", ["user_id"], name: "index_community_builder_links_on_user_id", using: :btree

  create_table "community_buyer_links", force: :cascade do |t|
    t.integer  "community_id"
    t.integer  "buyer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "community_buyer_links", ["buyer_id"], name: "index_community_buyer_links_on_buyer_id", using: :btree
  add_index "community_buyer_links", ["community_id"], name: "index_community_buyer_links_on_community_id", using: :btree

  create_table "community_house_links", force: :cascade do |t|
    t.integer  "house_id"
    t.integer  "community_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "community_house_links", ["community_id"], name: "index_community_house_links_on_community_id", using: :btree
  add_index "community_house_links", ["house_id"], name: "index_community_house_links_on_house_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_records", force: :cascade do |t|
    t.integer  "contractor_id"
    t.integer  "customer_id"
    t.integer  "house_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "price"
    t.string   "address"
    t.integer  "community_id"
  end

  add_index "customer_records", ["contractor_id"], name: "index_customer_records_on_contractor_id", using: :btree
  add_index "customer_records", ["customer_id"], name: "index_customer_records_on_customer_id", using: :btree
  add_index "customer_records", ["house_id"], name: "index_customer_records_on_house_id", using: :btree

  create_table "house_records", force: :cascade do |t|
    t.integer  "house_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "house_records", ["house_id"], name: "index_house_records_on_house_id", using: :btree
  add_index "house_records", ["user_id"], name: "index_house_records_on_user_id", using: :btree

  create_table "houses", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "image"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.string   "file"
    t.integer  "score"
    t.string   "meta"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "sender_name"
    t.string   "sender_email"
    t.text     "message_text"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "option_links", force: :cascade do |t|
    t.integer  "house_id"
    t.integer  "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "option_links", ["house_id"], name: "index_option_links_on_house_id", using: :btree
  add_index "option_links", ["option_id"], name: "index_option_links_on_option_id", using: :btree

  create_table "option_selection_records", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "option_selection_records", ["option_id"], name: "index_option_selection_records_on_option_id", using: :btree
  add_index "option_selection_records", ["user_id"], name: "index_option_selection_records_on_user_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "file"
    t.string   "category"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "loginCount"
  end

end
