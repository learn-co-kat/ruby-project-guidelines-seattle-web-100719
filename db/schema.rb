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

ActiveRecord::Schema.define(version: 2019_10_22_200756) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.integer "average_rating"
    t.string "publisher"
    t.integer "number_of_pages"
    t.integer "year_published"
    t.string "shelf"
    t.date "date_added"
  end

  create_table "readers", force: :cascade do |t|
    t.string "name"
  end

  create_table "reading_lists", force: :cascade do |t|
  end

end
