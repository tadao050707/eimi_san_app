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

ActiveRecord::Schema.define(version: 2022_12_03_045301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dogs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "size", null: false
    t.integer "vehicle", null: false
    t.integer "cleaning", null: false
    t.integer "active", null: false
    t.integer "exercise", null: false
    t.integer "home", null: false
    t.integer "house", null: false
    t.string "image_url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "dog_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "index_favorites_on_dog_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content", null: false
    t.text "image"
    t.bigint "user_id"
    t.bigint "dog_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "index_posts_on_dog_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "user_choices", force: :cascade do |t|
    t.integer "vehicle", null: false
    t.integer "cleaning", null: false
    t.integer "active", null: false
    t.integer "exercise", null: false
    t.integer "home", null: false
    t.integer "house", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_choices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "dogs"
  add_foreign_key "favorites", "users"
  add_foreign_key "posts", "dogs"
  add_foreign_key "posts", "users"
  add_foreign_key "user_choices", "users"
end
