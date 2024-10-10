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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"

  create_table "answering_bodies", id: :serial, force: :cascade do |t|
    t.integer "mnis_id", null: false
    t.string "name", limit: 255, null: false
  end

  create_table "members", id: :serial, force: :cascade do |t|
    t.integer "mnis_id", null: false
    t.string "display_name", limit: 255, null: false
    t.string "handle", limit: 255
  end

  create_table "questions", id: :serial, force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "asking_member_id", null: false
    t.string "house", limit: 20, null: false
    t.boolean "member_interest", default: false
    t.date "date_tabled", null: false
    t.string "uin", limit: 20, null: false
    t.text "question_text", null: false
    t.boolean "is_named_day", default: false
    t.boolean "is_holding_answer", default: false
    t.boolean "is_correcting_answer", default: false
    t.integer "answering_member_id", null: false
    t.integer "correcting_member_id"
    t.date "date_answered", null: false
    t.text "answer_text", null: false
    t.text "original_answer_text"
    t.text "comparable_answer_text"
    t.date "date_answer_corrected"
    t.date "date_answer_holding"
    t.string "heading", limit: 255
    t.date "pertinent_date", null: false
    t.integer "answering_body_id", null: false
    t.boolean "tweeted", default: false
  end

  create_table "written_statements", id: :serial, force: :cascade do |t|
    t.date "made_on", null: false
    t.string "uin", limit: 20, null: false
    t.string "title", limit: 255, null: false
    t.string "house_name", limit: 20, null: false
    t.string "member_role", limit: 255, null: false
    t.integer "member_id", null: false
    t.integer "answering_body_id", null: false
    t.boolean "posted_to_mastodon", default: false
    t.boolean "posted_to_bluesky", default: false
  end

  add_foreign_key "questions", "answering_bodies", name: "fk_answering_body"
  add_foreign_key "written_statements", "answering_bodies", name: "fk_answering_body"
  add_foreign_key "written_statements", "members", name: "fk_member"
end
