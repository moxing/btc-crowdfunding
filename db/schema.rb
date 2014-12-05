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

ActiveRecord::Schema.define(version: 20141205102945) do

  create_table "fund_units", force: true do |t|
    t.decimal  "unit"
    t.integer  "people"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fund_units", ["project_id"], name: "index_fund_units_on_project_id"

  create_table "project_details", force: true do |t|
    t.decimal  "amount"
    t.integer  "people"
    t.decimal  "min_amount"
    t.decimal  "raise_amount"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_detail_id"
  end

  add_index "projects", ["project_detail_id"], name: "index_projects_on_project_detail_id"
  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.integer  "user_type"
    t.string   "mail"
    t.string   "tel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
