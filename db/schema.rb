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

ActiveRecord::Schema[7.0].define(version: 2022_05_22_170439) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_instructors", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "instructor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_instructors_on_course_id"
    t.index ["instructor_id"], name: "index_course_instructors_on_instructor_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "number"
    t.string "section"
    t.string "year"
    t.string "quarter"
    t.boolean "sunday", default: false
    t.boolean "monday", default: false
    t.boolean "tuesday", default: false
    t.boolean "wednesday", default: false
    t.boolean "thursday", default: false
    t.boolean "friday", default: false
    t.boolean "saturday", default: false
    t.string "start_time"
    t.string "end_time"
    t.string "building", default: "TBA"
    t.string "room", default: "TBA"
    t.integer "credits", default: 100
    t.string "syllabus"
    t.string "program"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "academic_year"
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "title"
    t.string "course_number"
    t.string "course_section"
    t.string "quarter"
    t.string "year"
    t.string "instr_first_name"
    t.string "instr_last_name"
    t.integer "invited", default: 0
    t.integer "responded", default: 0
    t.float "percent_responded", default: 0.0
    t.float "hours_committed", default: 0.0
    t.float "material_conveyed_clear_score", default: 0.0
    t.float "material_conveyed_interesting_score", default: 0.0
    t.float "useful_tools_concepts_insights_score", default: 0.0
    t.float "useful_course_overall_score", default: 0.0
    t.float "recommendation_score", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "department", default: "Faculty"
    t.string "phone_number"
    t.string "email"
    t.string "academic_area", default: "TBD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "course_instructors", "courses"
  add_foreign_key "course_instructors", "instructors"
end
