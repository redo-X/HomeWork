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

ActiveRecord::Schema.define(version: 20160217163637) do

  create_table "article_groups", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "version"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "article_group_id"
  end

  add_index "articles", ["article_group_id"], name: "index_articles_on_article_group_id"

  create_table "customers", force: :cascade do |t|
    t.integer  "code"
    t.string   "name1"
    t.string   "name2"
    t.string   "phone"
    t.string   "fax"
    t.string   "mail"
    t.string   "contactperson"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "web"
  end

  create_table "production_order_attachments", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "production_orders", force: :cascade do |t|
    t.integer  "number"
    t.string   "description"
    t.integer  "quantity"
    t.integer  "pending_quantity"
    t.date     "release_date"
    t.date     "due_date"
    t.boolean  "isCompleted"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "article_id"
    t.integer  "customer_id"
    t.integer  "work_plan_id"
  end

  add_index "production_orders", ["article_id"], name: "index_production_orders_on_article_id"
  add_index "production_orders", ["customer_id"], name: "index_production_orders_on_customer_id"
  add_index "production_orders", ["work_plan_id"], name: "index_production_orders_on_work_plan_id"

  create_table "production_work_steps", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "production_order_id"
  end

  add_index "production_work_steps", ["production_order_id"], name: "index_production_work_steps_on_production_order_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

  create_table "work_plans", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_standard"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "work_steps", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "work_plan_id"
  end

  add_index "work_steps", ["work_plan_id"], name: "index_work_steps_on_work_plan_id"

end
