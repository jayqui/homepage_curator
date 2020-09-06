# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_06_052425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "link_subscriptions", force: :cascade do |t|
    t.bigint "recurrence_group_id", null: false
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recurrence_group_id"], name: "index_link_subscriptions_on_recurrence_group_id"
  end

  create_table "recurrence_groups", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_recurrence_groups_on_user_id"
  end

  create_table "recurrence_rules", force: :cascade do |t|
    t.bigint "recurrence_group_id", null: false
    t.string "day_of_week"
    t.interval "frequency", default: "7 days"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recurrence_group_id"], name: "index_recurrence_rules_on_recurrence_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "link_subscriptions", "recurrence_groups"
  add_foreign_key "recurrence_groups", "users"
  add_foreign_key "recurrence_rules", "recurrence_groups"
end
