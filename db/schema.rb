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

ActiveRecord::Schema.define(version: 2022_02_03_100726) do

  create_table "foods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sugar", null: false
    t.integer "role", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_foods_on_genre_id"
    t.index ["name"], name: "index_foods_on_name", unique: true
  end

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_genres_on_name", unique: true
  end

  create_table "meals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "meal_image", null: false
    t.integer "balance_of_payments"
    t.text "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "analyzed_foods"
    t.string "title"
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "used_foods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "food_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_used_foods_on_food_id"
    t.index ["meal_id", "food_id"], name: "index_used_foods_on_meal_id_and_food_id", unique: true
    t.index ["meal_id"], name: "index_used_foods_on_meal_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "gender", null: false
    t.integer "limit_level", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "crypted_password"
    t.string "salt"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "foods", "genres"
  add_foreign_key "meals", "users"
  add_foreign_key "used_foods", "foods"
  add_foreign_key "used_foods", "meals"
end
