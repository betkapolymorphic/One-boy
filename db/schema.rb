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

ActiveRecord::Schema.define(version: 20140624162147) do

  create_table "images", force: true do |t|
    t.integer  "colortype"
    t.integer  "colortype1"
    t.integer  "colortype2"
    t.integer  "colortype3"
    t.integer  "colortype4"
    t.string   "url",        limit: 600
    t.string   "rgb_colors"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operation_with_image_colors", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tmp", id: false, force: true do |t|
    t.integer "colortype",  null: false
    t.integer "colortype2", null: false
    t.integer "colortype3", null: false
    t.integer "colortype4", null: false
    t.integer "colortype5", null: false
    t.text    "url",        null: false
    t.text    "rgb_colors", null: false
  end

end
