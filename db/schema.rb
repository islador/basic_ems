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

ActiveRecord::Schema.define(version: 20140603145859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.integer  "course_id"
    t.date     "start_date"
    t.date     "due_date"
    t.integer  "max_points"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "courses", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "teacher_id"
    t.integer  "max_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "enrolled_student_assignments", force: true do |t|
    t.integer  "enrolled_student_id"
    t.integer  "assignment_id"
    t.integer  "earned_points"
    t.date     "submit_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "submission_file_name"
    t.string   "submission_content_type"
    t.integer  "submission_file_size"
    t.datetime "submission_updated_at"
  end

  create_table "enrolled_students", force: true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.integer  "total_earned_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
