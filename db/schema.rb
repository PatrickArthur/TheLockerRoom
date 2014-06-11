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

ActiveRecord::Schema.define(version: 20140611210736) do

  create_table "profiles", force: true do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "sport",      null: false
    t.string   "address",    null: false
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.string   "zip",        null: false
    t.string   "phone",      null: false
    t.string   "email",      null: false
    t.string   "gender",     null: false
    t.integer  "age",        null: false
    t.integer  "weight",     null: false
    t.integer  "height",     null: false
    t.integer  "waist",      null: false
    t.integer  "neck",       null: false
    t.integer  "hip",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
