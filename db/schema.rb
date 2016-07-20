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

ActiveRecord::Schema.define(version: 20160720192035) do

  create_table "attachments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "file"
    t.integer  "attached_item_id"
    t.string   "attached_item_type"
    t.string   "original_filename"
    t.string   "content_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["attached_item_id"], name: "index_attachments_on_attached_item_id"
    t.index ["attached_item_type"], name: "index_attachments_on_attached_item_type"
  end

  create_table "commodities", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.string   "unit_of_measure"
    t.string   "category"
    t.boolean  "active"
    t.integer  "company_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "commodity_items", force: :cascade do |t|
    t.decimal  "gross"
    t.decimal  "tare"
    t.decimal  "price"
    t.decimal  "total"
    t.integer  "commodity_id"
    t.integer  "transaction_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "business_name"
    t.string   "email"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "id_number"
    t.string   "id_state"
    t.date     "id_expiration"
    t.integer  "company_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "user_id"
    t.string   "category"
    t.string   "status"
    t.decimal  "discount",    default: "0.0"
    t.decimal  "tax",         default: "0.0"
    t.decimal  "total"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
