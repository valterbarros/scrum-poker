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

ActiveRecord::Schema.define(version: 20171113032315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "session_votes", id: :serial, force: :cascade do |t|
    t.boolean "closed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "session_votes_tasks", id: false, force: :cascade do |t|
    t.integer "task_id"
    t.integer "session_vote_id"
    t.index ["session_vote_id"], name: "index_session_votes_tasks_on_session_vote_id"
    t.index ["task_id"], name: "index_session_votes_tasks_on_task_id"
  end

  create_table "session_votes_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "session_vote_id"
    t.index ["session_vote_id"], name: "index_session_votes_users_on_session_vote_id"
    t.index ["user_id"], name: "index_session_votes_users_on_user_id"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.float "vote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "session_vote_id"
    t.integer "user_id"
    t.integer "task_id"
    t.index ["session_vote_id"], name: "index_votes_on_session_vote_id"
    t.index ["task_id"], name: "index_votes_on_task_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end
