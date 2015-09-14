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

ActiveRecord::Schema.define(version: 20150914054453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "answer"
    t.integer  "question_id"
    t.integer  "user_id"
    t.integer  "views"
    t.string   "effective"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "ask_to_answers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ask_to_answers", ["question_id"], name: "index_ask_to_answers_on_question_id", using: :btree
  add_index "ask_to_answers", ["user_id"], name: "index_ask_to_answers_on_user_id", using: :btree

  create_table "avatars", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_questions", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_questions", ["category_id"], name: "index_category_questions_on_category_id", using: :btree
  add_index "category_questions", ["question_id"], name: "index_category_questions_on_question_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["answer_id"], name: "index_comments_on_answer_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "flags", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "flags", ["question_id"], name: "index_flags_on_question_id", using: :btree
  add_index "flags", ["user_id"], name: "index_flags_on_user_id", using: :btree

  create_table "follow_doctors", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "follow_doctors", ["user_id"], name: "index_follow_doctors_on_user_id", using: :btree

  create_table "follow_questions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "follow_questions", ["question_id"], name: "index_follow_questions_on_question_id", using: :btree
  add_index "follow_questions", ["user_id"], name: "index_follow_questions_on_user_id", using: :btree

  create_table "markspams", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "markspams", ["answer_id"], name: "index_markspams_on_answer_id", using: :btree
  add_index "markspams", ["question_id"], name: "index_markspams_on_question_id", using: :btree
  add_index "markspams", ["user_id"], name: "index_markspams_on_user_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "information"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "heading"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["category_id"], name: "index_questions_on_category_id", using: :btree
  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "thanks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "thanks", ["answer_id"], name: "index_thanks_on_answer_id", using: :btree
  add_index "thanks", ["user_id"], name: "index_thanks_on_user_id", using: :btree

  create_table "tip_of_the_days", force: :cascade do |t|
    t.string   "tip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trendings", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "points"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "trendings", ["question_id"], name: "index_trendings_on_question_id", using: :btree

  create_table "upvotes", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "upvotes", ["answer_id"], name: "index_upvotes_on_answer_id", using: :btree
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "pid"
    t.datetime "dob"
    t.integer  "avatar_id"
    t.string   "description"
    t.string   "role"
    t.string   "qualification"
    t.integer  "experience"
    t.string   "city"
    t.string   "string"
    t.integer  "credits"
    t.string   "hospital"
    t.string   "speciality"
    t.string   "photoid"
    t.string   "certificate"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "username"
    t.string   "password_hash"
  end

  add_index "users", ["avatar_id"], name: "index_users_on_avatar_id", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "ask_to_answers", "questions"
  add_foreign_key "ask_to_answers", "users"
  add_foreign_key "category_questions", "categories"
  add_foreign_key "category_questions", "questions"
  add_foreign_key "comments", "answers"
  add_foreign_key "comments", "users"
  add_foreign_key "flags", "questions"
  add_foreign_key "flags", "users"
  add_foreign_key "follow_doctors", "users"
  add_foreign_key "follow_questions", "questions"
  add_foreign_key "follow_questions", "users"
  add_foreign_key "markspams", "answers"
  add_foreign_key "markspams", "questions"
  add_foreign_key "markspams", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "questions", "categories"
  add_foreign_key "questions", "users"
  add_foreign_key "thanks", "answers"
  add_foreign_key "thanks", "users"
  add_foreign_key "trendings", "questions"
  add_foreign_key "upvotes", "answers"
  add_foreign_key "upvotes", "users"
  add_foreign_key "users", "avatars"
end
