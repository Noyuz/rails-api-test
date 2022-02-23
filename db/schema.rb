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

ActiveRecord::Schema.define(version: 2022_02_23_175711) do

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "test_results", force: :cascade do |t|
    t.integer "test_id", null: false
    t.integer "student_id", null: false
    t.integer "score"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_test_results_on_student_id"
    t.index ["test_id", "student_id"], name: "index_test_results_on_test_id_and_student_id", unique: true
    t.index ["test_id"], name: "index_test_results_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.integer "maximum_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "test_results", "students"
  add_foreign_key "test_results", "tests"
end
