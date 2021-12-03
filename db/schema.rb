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

ActiveRecord::Schema.define(version: 2021_12_03_221059) do

  create_table "applications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pet_id"
    t.string "application_type"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "breed_preferences", force: :cascade do |t|
    t.integer "user_id"
    t.integer "breed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "breed_webs", force: :cascade do |t|
    t.integer "primary_breed_id"
    t.integer "similar_breed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "interests", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "interested_in_fostering_dogs"
    t.boolean "interested_in_fostering_cats"
    t.boolean "interested_in_adopting_dogs"
    t.boolean "interested_in_adopting_cats"
    t.integer "children_competability_preference"
    t.integer "dog_competability_preference"
    t.integer "cat_competability_preference"
    t.integer "activity_competability_preference"
    t.integer "home_alone_competability_preference"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "list_of_breeds", force: :cascade do |t|
    t.string "species"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "user_id"
    t.float "match_strength"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pet_breeds", force: :cascade do |t|
    t.integer "breed_id"
    t.integer "pet_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.date "estimated_birthday"
    t.string "status"
    t.integer "adopter_id"
    t.string "gender"
    t.string "weight"
    t.integer "children_competability_ranking"
    t.integer "dog_competability_ranking"
    t.integer "cat_competability_ranking"
    t.integer "home_alone_competability_ranking"
    t.integer "activity_competability_ranking"
    t.text "notes"
    t.integer "foster_id"
    t.string "species"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "picture"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "account_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "watchlists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pet_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
