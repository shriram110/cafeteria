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

ActiveRecord::Schema.define(version: 2020_06_18_150642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cartitems", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "quantity"
    t.bigint "menuitem_id"
    t.bigint "user_id"
  end

  create_table "menuitems", force: :cascade do |t|
    t.bigint "menu_id"
    t.string "name"
    t.text "description"
    t.float "price"
    t.string "category_name"
    t.text "imgaddr"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.boolean "activemenu"
  end

  create_table "orderitems", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "menuitem_id"
    t.string "menuitem_name"
    t.float "menuitem_price"
    t.integer "menuitem_quantity"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "ordered_at"
    t.bigint "user_id"
    t.datetime "delivered_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "email_id"
    t.string "password_digest"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
