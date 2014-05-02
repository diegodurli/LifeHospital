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

ActiveRecord::Schema.define(version: 20140501172530) do

  create_table "clinical_outcomes", force: true do |t|
    t.text     "description"
    t.text     "observations"
    t.string   "status"
    t.integer  "medicalrecord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clinical_outcomes", ["medicalrecord_id"], name: "index_clinical_outcomes_on_medicalrecord_id"

  create_table "diet_prescriptions", force: true do |t|
    t.integer  "diet_id"
    t.integer  "prescription_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diet_prescriptions", ["diet_id"], name: "index_diet_prescriptions_on_diet_id"
  add_index "diet_prescriptions", ["prescription_id"], name: "index_diet_prescriptions_on_prescription_id"

  create_table "diets", force: true do |t|
    t.text     "description"
    t.integer  "hospitalization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diets", ["hospitalization_id"], name: "index_diets_on_hospitalization_id"

  create_table "exams", force: true do |t|
    t.text     "description"
    t.text     "observations"
    t.text     "archive"
    t.boolean  "scheduled"
    t.integer  "medicalrecord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exams", ["medicalrecord_id"], name: "index_exams_on_medicalrecord_id"

  create_table "hospitalizations", force: true do |t|
    t.text     "location"
    t.text     "procedures"
    t.text     "treatments"
    t.integer  "user_id"
    t.integer  "medicalrecord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hospitalizations", ["medicalrecord_id"], name: "index_hospitalizations_on_medicalrecord_id"
  add_index "hospitalizations", ["user_id"], name: "index_hospitalizations_on_user_id"

  create_table "inventories", force: true do |t|
    t.decimal  "total_value"
    t.string   "document"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventory_movements", force: true do |t|
    t.integer  "inventory_id"
    t.integer  "medicament_id"
    t.integer  "quantity"
    t.decimal  "unit_value"
    t.decimal  "total_value"
    t.string   "movement_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inventory_movements", ["inventory_id"], name: "index_inventory_movements_on_inventory_id"
  add_index "inventory_movements", ["medicament_id"], name: "index_inventory_movements_on_medicament_id"

  create_table "medical_records", force: true do |t|
    t.text     "description"
    t.text     "historic"
    t.integer  "hospitalization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medical_records", ["hospitalization_id"], name: "index_medical_records_on_hospitalization_id"

  create_table "medicaments", force: true do |t|
    t.text     "description"
    t.decimal  "dosage"
    t.integer  "inventory_min"
    t.integer  "medicalrecord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medicaments", ["medicalrecord_id"], name: "index_medicaments_on_medicalrecord_id"

  create_table "prescriptions", force: true do |t|
    t.integer  "quantity"
    t.string   "unit"
    t.text     "diet"
    t.decimal  "calories"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "procedures", force: true do |t|
    t.text     "description"
    t.text     "observations"
    t.boolean  "scheduled"
    t.integer  "medicalrecord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "procedures", ["medicalrecord_id"], name: "index_procedures_on_medicalrecord_id"

  create_table "serum_applications", force: true do |t|
    t.integer  "serum_id"
    t.integer  "hospitalization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "serum_applications", ["hospitalization_id"], name: "index_serum_applications_on_hospitalization_id"
  add_index "serum_applications", ["serum_id"], name: "index_serum_applications_on_serum_id"

  create_table "serums", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "special_cares", force: true do |t|
    t.text     "description"
    t.date     "desactivation"
    t.integer  "hospitalization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "special_cares", ["hospitalization_id"], name: "index_special_cares_on_hospitalization_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.integer  "document"
    t.string   "phone"
    t.string   "address"
    t.string   "contact"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"

end
