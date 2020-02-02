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

ActiveRecord::Schema.define(version: 2020_02_02_210054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "topic_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_messages_on_topic_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "mission_members", force: :cascade do |t|
    t.bigint "mission_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_mission_members_on_mission_id"
    t.index ["user_id"], name: "index_mission_members_on_user_id"
  end

  create_table "missions", force: :cascade do |t|
    t.bigint "project_id"
    t.date "start_date"
    t.date "due_date"
    t.string "title"
    t.text "description"
    t.string "status"
    t.string "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_missions_on_project_id"
  end

  create_table "project_members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_members_on_project_id"
    t.index ["user_id"], name: "index_project_members_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "manager"
    t.date "delivery_date"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_members", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_task_members_on_task_id"
    t.index ["user_id"], name: "index_task_members_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "mission_id"
    t.date "start_date"
    t.date "due_date"
    t.string "title"
    t.text "description"
    t.string "status"
    t.string "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_tasks_on_mission_id"
  end

  create_table "topics", force: :cascade do |t|
    t.bigint "mission_id"
    t.string "title"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_topics_on_mission_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "topics"
  add_foreign_key "messages", "users"
  add_foreign_key "mission_members", "missions"
  add_foreign_key "mission_members", "users"
  add_foreign_key "missions", "projects"
  add_foreign_key "project_members", "projects"
  add_foreign_key "project_members", "users"
  add_foreign_key "task_members", "tasks"
  add_foreign_key "task_members", "users"
  add_foreign_key "tasks", "missions"
  add_foreign_key "topics", "missions"
end
