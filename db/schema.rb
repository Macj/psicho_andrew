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

ActiveRecord::Schema.define(version: 20201212214133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "cathegory_id"
    t.integer  "style",              limit: 2
    t.string   "tags"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "description"
    t.index ["cathegory_id"], name: "index_articles_on_cathegory_id", using: :btree
  end

  create_table "cathegories", force: :cascade do |t|
    t.integer  "parent_id"
    t.boolean  "is_pro"
    t.string   "parent_link"
    t.integer  "level"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "name"
    t.boolean  "visible"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "agree"
    t.boolean  "viber"
    t.boolean  "telegram"
    t.boolean  "whatsup"
    t.boolean  "personal_info"
    t.boolean  "contract"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.text     "programm"
    t.text     "video"
    t.string   "shipping_type"
    t.string   "term"
    t.float    "coast_rb"
    t.float    "coast_dl"
    t.float    "coast_hr"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "title"
    t.string   "place"
    t.date     "from"
    t.date     "till"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.text     "query"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "viber"
    t.boolean  "telegram"
    t.boolean  "whatsapp"
    t.text     "request"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price_hr"
    t.float    "price_dl"
    t.float    "price_rb"
    t.integer  "visit_num"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "term"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "articles", "cathegories"
end
