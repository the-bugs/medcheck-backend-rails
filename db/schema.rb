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

ActiveRecord::Schema[7.0].define(version: 2023_11_21_191226) do
  create_table "appointments", force: :cascade do |t|
    t.integer "medic_id", null: false
    t.integer "patient_id", null: false
    t.datetime "date"
    t.string "type"
    t.boolean "finished"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medic_id"], name: "index_appointments_on_medic_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "medics", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "specialty_id", null: false
    t.string "registry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specialty_id"], name: "index_medics_on_specialty_id"
    t.index ["user_id"], name: "index_medics_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "dob"
    t.string "sex"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_records_on_patient_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "medic_id", null: false
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medic_id"], name: "index_schedules_on_medic_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "user_type"
    t.boolean "is_admin"
  end

  add_foreign_key "appointments", "medics"
  add_foreign_key "appointments", "patients"
  add_foreign_key "medics", "specialties"
  add_foreign_key "medics", "users"
  add_foreign_key "patients", "users"
  add_foreign_key "records", "patients"
  add_foreign_key "schedules", "medics"
end
