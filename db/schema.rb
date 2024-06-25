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

ActiveRecord::Schema[7.1].define(version: 2024_06_20_163033) do
  create_table "course_students", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "c_id"
    t.integer "s_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "course_title"
    t.text "description"
    t.string "course_code"
    t.integer "credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "faculty_id"
  end

  create_table "faculties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "Faculty_id"
    t.string "gender"
    t.date "dob"
    t.text "address"
    t.string "email"
    t.integer "phone"
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_faculties_on_user_id"
  end

  create_table "st_marks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "roll_no"
    t.string "course_title"
    t.integer "course_id"
    t.integer "credit"
    t.integer "mark"
    t.integer "s_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "roll_no"
    t.string "gender"
    t.date "dob"
    t.text "address"
    t.string "email"
    t.string "phone"
    t.string "blood_group"
    t.string "dept"
    t.string "parent_name"
    t.string "parent_phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_student_details_on_user_id"
  end

  create_table "student_marks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "roll_no"
    t.string "course_title"
    t.integer "course_id"
    t.integer "credit"
    t.integer "mark"
    t.integer "s_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
