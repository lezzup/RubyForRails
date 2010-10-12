# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101011152332) do

  create_table "composers", :force => true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "middle_name"
    t.integer "birth_year"
    t.integer "death_year"
    t.integer "country"
  end

  create_table "customers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nick"
    t.string   "password"
    t.string   "email"
  end

  create_table "editions", :force => true do |t|
    t.string  "description",  :limit => 30
    t.integer "year"
    t.float   "price"
    t.integer "publisher_id"
    t.integer "len"
  end

  create_table "editions_works", :id => false, :force => true do |t|
    t.integer "edition_id"
    t.integer "work_id"
  end

  create_table "instruments", :force => true do |t|
    t.string   "name"
    t.string   "family"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instruments_works", :id => false, :force => true do |t|
    t.integer "instrument_id"
    t.integer "work_id"
  end

  create_table "orders", :force => true do |t|
    t.integer  "edition_id"
    t.integer  "customer_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "works", :force => true do |t|
    t.integer "composer_id"
    t.string  "title"
    t.string  "kee"
    t.string  "opus"
  end

end
