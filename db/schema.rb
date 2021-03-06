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

ActiveRecord::Schema.define(version: 20180402091234) do

  create_table "reviews", force: :cascade do |t|
    t.integer "show_id"
    t.string  "critic_name"
    t.string  "publication_name"
    t.float   "score"
    t.text    "body"
  end

  add_index "reviews", ["show_id"], name: "index_reviews_on_show_id"

  create_table "shows", force: :cascade do |t|
    t.string  "title"
    t.text    "description"
    t.float   "ave_score",    default: 0.0
    t.integer "review_count", default: 0
  end

end
