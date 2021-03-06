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

ActiveRecord::Schema.define(version: 20170309180913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pieces", force: :cascade do |t|
    t.text     "title",       null: false
    t.text     "url",         null: false
    t.text     "description"
    t.text     "category"
    t.integer  "price"
    t.boolean  "featured"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "for_sale"
    t.boolean  "available"
    t.integer  "year"
    t.string   "size"
  end

  create_table "pieces_tags", id: false, force: :cascade do |t|
    t.integer  "piece_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.text     "label",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label"], name: "index_tags_on_label", unique: true, using: :btree
  end

end
