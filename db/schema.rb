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

ActiveRecord::Schema.define(version: 20130819120038) do

  create_table "images", force: true do |t|
    t.string   "name"
    t.text     "src"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "detail_url"
    t.string   "click_url"
    t.string   "shop_click_url"
    t.string   "num_iid"
    t.string   "title"
    t.string   "nick"
    t.string   "type"
    t.text     "desc"
    t.datetime "created"
    t.string   "pic_url"
    t.integer  "num"
    t.text     "item_imgs"
    t.text     "prop_imgs"
    t.decimal  "price",             precision: 8, scale: 2, default: 0.0
    t.decimal  "coupon_price",      precision: 8, scale: 2
    t.string   "coupon_rate"
    t.datetime "coupon_start_time"
    t.datetime "coupon_end_time"
    t.string   "commission"
    t.string   "commission_rate"
    t.string   "commission_num"
    t.string   "commission_volumn"
    t.integer  "volumn"
    t.string   "shop_type"
    t.integer  "node_id"
  end

  create_table "nodes", force: true do |t|
    t.string   "name"
    t.integer  "sort"
    t.string   "summary"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "name"
    t.integer  "sort"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.boolean  "highlight"
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
