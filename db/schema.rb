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

ActiveRecord::Schema.define(version: 20220706001215) do

  create_table "categories", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "characters", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "name"
    t.integer  "age"
    t.float    "weight",             limit: 24
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characters", ["name"], name: "index_characters_on_name", using: :btree

  create_table "movie_characters", force: true do |t|
    t.integer  "movie_id"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movie_characters", ["character_id"], name: "index_movie_characters_on_character_id", using: :btree
  add_index "movie_characters", ["movie_id"], name: "index_movie_characters_on_movie_id", using: :btree

  create_table "movies", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "title"
    t.date     "creation_date"
    t.integer  "qualification"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movies", ["category_id"], name: "index_movies_on_category_id", using: :btree
  add_index "movies", ["qualification"], name: "index_movies_on_qualification", using: :btree
  add_index "movies", ["title"], name: "index_movies_on_title", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "token"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
