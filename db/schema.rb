
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

ActiveRecord::Schema.define(version: 20140731152745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: true do |t|
    t.decimal  "amount",     precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "product_id",                                       null: false
    t.integer  "user_id",                                          null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "bids", ["amount", "product_id"], name: "index_bids_on_amount_and_product_id", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "images", force: true do |t|
    t.string   "url",        null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["product_id"], name: "index_images_on_product_id", using: :btree

  create_table "payments", force: true do |t|
    t.decimal  "amount",                precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "buyer_id",                                                    null: false
    t.integer  "seller_id",                                                   null: false
    t.integer  "product_id",                                                  null: false
    t.string   "stripe_customer_token",                                       null: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "payments", ["buyer_id"], name: "index_payments_on_buyer_id", using: :btree
  add_index "payments", ["product_id"], name: "index_payments_on_product_id", using: :btree
  add_index "payments", ["seller_id"], name: "index_payments_on_seller_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name",                                                    null: false
    t.string   "condition",                                               null: false
    t.text     "description",                                             null: false
    t.integer  "user_id",                                                 null: false
    t.integer  "category_id",                                             null: false
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.decimal  "price",             precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "auction_starts_at",                                       null: false
    t.datetime "auction_ends_at",                                         null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.boolean  "admin",           default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
