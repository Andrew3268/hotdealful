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

ActiveRecord::Schema.define(version: 2021_07_17_044130) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "picks", force: :cascade do |t|
    t.integer "user_id"
    t.string "p_title"
    t.string "p_image"
    t.string "p_link"
    t.string "p_hashtag"
    t.string "p_spare_01"
    t.string "p_spare_02"
    t.string "p_spare_03"
    t.string "p_spare_04"
    t.string "p_spare_05"
    t.text "p_spare_31"
    t.text "p_spare_32"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "picks_tags", id: false, force: :cascade do |t|
    t.integer "pick_id"
    t.integer "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pick_id"], name: "index_picks_tags_on_pick_id"
    t.index ["tag_id"], name: "index_picks_tags_on_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "link"
    t.string "image"
    t.string "source"
    t.string "hashtag"
    t.string "promocode"
    t.string "rating"
    t.string "review_count"
    t.decimal "is_price"
    t.decimal "was_price"
    t.decimal "pct"
    t.text "description"
    t.string "spare_01"
    t.string "spare_02"
    t.string "spare_03"
    t.string "spare_04"
    t.string "spare_05"
    t.string "spare_06"
    t.string "spare_07"
    t.string "spare_08"
    t.string "spare_09"
    t.string "spare_10"
    t.string "spare_11"
    t.string "spare_12"
    t.string "spare_13"
    t.string "spare_14"
    t.string "spare_15"
    t.text "spare_31"
    t.text "spare_32"
    t.float "spare_41"
    t.float "spare_42"
    t.float "spare_43"
    t.float "spare_44"
    t.float "spare_45"
    t.integer "spare_56"
    t.integer "spare_57"
    t.integer "spare_58"
    t.integer "spare_59"
    t.integer "spare_60"
    t.decimal "spare_61"
    t.decimal "spare_62"
    t.decimal "spare_63"
    t.decimal "spare_64"
    t.decimal "spare_65"
    t.datetime "spare_66"
    t.datetime "spare_67"
    t.datetime "spare_68"
    t.date "spare_71"
    t.date "spare_72"
    t.date "spare_73"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_posts_tags_on_post_id"
    t.index ["tag_id"], name: "index_posts_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "picks_tags", "picks"
  add_foreign_key "picks_tags", "tags"
  add_foreign_key "posts_tags", "posts"
  add_foreign_key "posts_tags", "tags"
end
