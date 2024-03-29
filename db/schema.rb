# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_13_131033) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "fuzzystrmatch"
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.float "rate"
    t.string "author_tip"
    t.string "budget"
    t.string "prep_time"
    t.text "ingredients", default: [], array: true
    t.string "author"
    t.string "difficulty"
    t.integer "people_quantity"
    t.string "cook_time"
    t.text "tags", default: [], array: true
    t.string "total_time"
    t.string "image"
    t.integer "nb_comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.tsvector "ingredients_tsvector"
    t.index ["ingredients_tsvector"], name: "index_recipes_on_ingredients_tsvector", using: :gin
  end

end
