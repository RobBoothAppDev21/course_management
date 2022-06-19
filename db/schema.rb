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

ActiveRecord::Schema[7.0].define(version: 2022_06_19_163727) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bid_histories", force: :cascade do |t|
    t.string "course_number"
    t.string "course_section"
    t.string "course_title"
    t.string "course_quarter"
    t.string "course_year"
    t.string "day_time"
    t.string "instructor"
    t.integer "phase1_enrollment", default: 0
    t.integer "phase1_seats_available", default: 0
    t.integer "phase1_price", default: 0
    t.integer "phase2_enrollment", default: 0
    t.integer "phase2_seats_available", default: 0
    t.integer "phase2_price", default: 0
    t.integer "phase1_new_students_enrollment", default: 0
    t.integer "phase1_new_students_seats_available", default: 0
    t.integer "phase1_new_students_price", default: 0
    t.integer "phase2_new_students_enrollment", default: 0
    t.integer "phase2_new_students_seats_available", default: 0
    t.integer "phase2_new_students_price", default: 0
    t.integer "phase3_enrollment", default: 0
    t.integer "phase3_seats_available", default: 0
    t.integer "phase3_price", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "section_id"
    t.text "searchable"
    t.index ["section_id"], name: "index_bid_histories_on_section_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.string "number", null: false
    t.string "description", default: "TBD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sections_count"
    t.integer "credits", default: 0
    t.text "searchable"
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "course_title"
    t.string "course_number"
    t.string "course_section"
    t.string "course_quarter"
    t.string "course_year"
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
    t.bigint "section_id"
    t.bigint "instructor_id"
    t.text "searchable"
    t.index ["instructor_id"], name: "index_evaluations_on_instructor_id"
    t.index ["section_id"], name: "index_evaluations_on_section_id"
  end

  create_table "instructor_sections", force: :cascade do |t|
    t.bigint "section_id", null: false
    t.bigint "instructor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_instructor_sections_on_instructor_id"
    t.index ["section_id"], name: "index_instructor_sections_on_section_id"
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
    t.text "searchable"
  end

  create_table "sections", force: :cascade do |t|
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
    t.bigint "course_id"
    t.text "searchable"
    t.index ["course_id"], name: "index_sections_on_course_id"
  end

  add_foreign_key "bid_histories", "sections"
  add_foreign_key "evaluations", "instructors"
  add_foreign_key "evaluations", "sections"
  add_foreign_key "instructor_sections", "instructors"
  add_foreign_key "instructor_sections", "sections"
  add_foreign_key "sections", "courses"
end
