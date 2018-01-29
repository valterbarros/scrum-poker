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

ActiveRecord::Schema.define(version: 20180129012238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards_steps", force: :cascade do |t|
    t.bigint "step_id"
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_cards_steps_on_card_id"
    t.index ["step_id"], name: "index_cards_steps_on_step_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_tasks", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_tasks_on_category_id"
    t.index ["task_id"], name: "index_categories_tasks_on_task_id"
  end

  create_table "invites", force: :cascade do |t|
    t.bigint "session_vote_id"
    t.integer "recipient_id", null: false
    t.integer "sender_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token", null: false
    t.index ["recipient_id"], name: "index_invites_on_recipient_id"
    t.index ["sender_id"], name: "index_invites_on_sender_id"
    t.index ["session_vote_id"], name: "index_invites_on_session_vote_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "session_votes", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "status", default: 0
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_session_votes_on_owner_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "title"
    t.bigint "session_vote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_vote_id"], name: "index_steps_on_session_vote_id"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "session_vote_id"
    t.index ["session_vote_id"], name: "index_tasks_on_session_vote_id"
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
    t.bigint "session_vote_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["session_vote_id"], name: "index_users_on_session_vote_id"
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "session_vote_id"
    t.integer "user_id"
    t.integer "task_id"
    t.string "score"
    t.index ["session_vote_id"], name: "index_votes_on_session_vote_id"
    t.index ["task_id"], name: "index_votes_on_task_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "cards_steps", "cards"
  add_foreign_key "cards_steps", "steps"
  add_foreign_key "categories_tasks", "categories"
  add_foreign_key "categories_tasks", "tasks"
  add_foreign_key "invites", "session_votes"
  add_foreign_key "invites", "users", column: "recipient_id"
  add_foreign_key "invites", "users", column: "sender_id"
  add_foreign_key "notifications", "users"
  add_foreign_key "session_votes", "users", column: "owner_id"
  add_foreign_key "steps", "session_votes"
  add_foreign_key "tasks", "session_votes"
  add_foreign_key "users", "session_votes"
  add_foreign_key "votes", "session_votes"
  add_foreign_key "votes", "tasks"
  add_foreign_key "votes", "users"
end
