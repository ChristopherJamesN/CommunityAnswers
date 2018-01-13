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

ActiveRecord::Schema.define(version: 20171222204544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answered_questions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.integer "yes"
    t.integer "no"
    t.integer "unsure"
    t.string "comments"
    t.integer "user_id"
    t.integer "yes12"
    t.integer "yes26"
    t.integer "yes45"
    t.integer "yes63"
    t.integer "yes80"
    t.integer "yes_male"
    t.integer "yes_female"
    t.integer "yes_other"
    t.integer "no12"
    t.integer "no26"
    t.integer "no45"
    t.integer "no63"
    t.integer "no80"
    t.integer "no_male"
    t.integer "no_female"
    t.integer "no_other"
    t.integer "unsure12"
    t.integer "unsure26"
    t.integer "unsure45"
    t.integer "unsure63"
    t.integer "unsure80"
    t.integer "unsure_male"
    t.integer "unsure_female"
    t.integer "unsure_other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "users", force: :cascade do |t|
    t.integer "age"
    t.string "sex"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
