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

ActiveRecord::Schema.define(version: 20140327194212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.integer  "progress",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "drugstore_chains", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
  end

  create_table "drugstores", force: true do |t|
    t.integer  "drugstore_chain_id"
    t.integer  "external_id"
    t.string   "name"
    t.string   "address"
    t.string   "working_hours"
    t.string   "phone"
    t.datetime "data_last_update"
    t.integer  "product_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ds_files", force: true do |t|
    t.string   "file"
    t.integer  "drugstore_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ds_products", force: true do |t|
    t.integer  "external_id"
    t.integer  "product_id"
    t.string   "full_name"
    t.float    "max_price"
    t.float    "min_price"
    t.float    "avg_price"
    t.integer  "drugstore_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ds_products", ["external_id"], name: "index_ds_products_on_external_id", using: :btree
  add_index "ds_products", ["product_id"], name: "index_ds_products_on_product_id", using: :btree

  create_table "product_prices", force: true do |t|
    t.integer  "ds_product_id"
    t.integer  "drugstore_id"
    t.integer  "external_id"
    t.text     "full_name"
    t.float    "price"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_prices", ["drugstore_id"], name: "index_product_prices_on_drugstore_id", using: :btree
  add_index "product_prices", ["ds_product_id"], name: "index_product_prices_on_ds_product_id", using: :btree
  add_index "product_prices", ["external_id"], name: "index_product_prices_on_external_id", using: :btree

  create_table "rls_files", force: true do |t|
    t.string   "name"
    t.string   "rls_file"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",     default: "Uploaded"
    t.integer  "size"
  end

  create_table "rls_products", force: true do |t|
    t.integer  "code"
    t.text     "name"
    t.string   "category"
    t.text     "product_group_type"
    t.string   "product_form"
    t.string   "dose"
    t.string   "pack"
    t.string   "company"
    t.string   "country"
    t.text     "inn"
    t.integer  "ean",                limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rls_products", ["code"], name: "index_rls_products_on_code", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",              default: false
    t.integer  "drugstore_chain_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
