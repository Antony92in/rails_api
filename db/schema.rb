# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_27_094421) do

  create_table "books", force: :cascade do |t|
    t.string "title"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
  end

  create_table "shop_books", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "shop_id"
    t.bigint "publisher_id"
    t.bigint "copies_in_stock"
    t.bigint "sold"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
  end

end
