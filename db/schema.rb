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

ActiveRecord::Schema.define(version: 2022_11_12_101737) do

  create_table "coupons", force: :cascade do |t|
    t.integer "user_id"
    t.string "c_title"
    t.string "c_link"
    t.string "c_image"
    t.string "c_source"
    t.string "c_hashtag"
    t.string "c_promocode"
    t.string "c_rating"
    t.string "c_review_count"
    t.decimal "c_is_price"
    t.decimal "c_was_price"
    t.decimal "c_pct"
    t.text "c_description"
    t.string "c_spare_01"
    t.string "c_spare_02"
    t.string "c_spare_03"
    t.string "c_spare_04"
    t.string "c_spare_05"
    t.string "c_spare_06"
    t.string "c_spare_07"
    t.string "c_spare_08"
    t.string "c_spare_09"
    t.string "c_spare_10"
    t.string "c_spare_11"
    t.string "c_spare_12"
    t.string "c_spare_13"
    t.string "c_spare_14"
    t.string "c_spare_15"
    t.text "c_spare_31"
    t.text "c_spare_32"
    t.float "c_spare_41"
    t.float "c_spare_42"
    t.float "c_spare_43"
    t.float "c_spare_44"
    t.float "c_spare_45"
    t.integer "c_spare_56"
    t.integer "c_spare_57"
    t.integer "c_spare_58"
    t.integer "c_spare_59"
    t.integer "c_spare_60"
    t.decimal "c_spare_61"
    t.decimal "c_spare_62"
    t.decimal "c_spare_63"
    t.decimal "c_spare_64"
    t.decimal "c_spare_65"
    t.datetime "c_spare_66"
    t.datetime "c_spare_67"
    t.datetime "c_spare_68"
    t.date "c_spare_71"
    t.date "c_spare_72"
    t.date "c_spare_73"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_coupons_on_slug", unique: true
  end

  create_table "coupons_tags", id: false, force: :cascade do |t|
    t.integer "coupon_id"
    t.integer "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coupon_id"], name: "index_coupons_tags_on_coupon_id"
    t.index ["tag_id"], name: "index_coupons_tags_on_tag_id"
  end

  create_table "deals", force: :cascade do |t|
    t.integer "user_id"
    t.string "d_title"
    t.string "d_image"
    t.string "d_link"
    t.string "d_source"
    t.decimal "d_price"
    t.string "d_spare_01"
    t.string "d_spare_02"
    t.string "d_spare_03"
    t.string "d_spare_04"
    t.string "d_spare_05"
    t.string "d_spare_06"
    t.string "d_spare_07"
    t.string "d_spare_08"
    t.string "d_spare_09"
    t.string "d_spare_10"
    t.text "d_spare_31"
    t.text "d_spare_32"
    t.float "d_spare_41"
    t.float "d_spare_42"
    t.float "d_spare_43"
    t.integer "d_spare_56"
    t.integer "d_spare_57"
    t.integer "d_spare_58"
    t.decimal "d_spare_61"
    t.decimal "d_spare_62"
    t.decimal "d_spare_63"
    t.datetime "d_spare_66"
    t.datetime "d_spare_67"
    t.date "d_spare_71"
    t.date "d_spare_72"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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

  create_table "homes", force: :cascade do |t|
    t.integer "user_id"
    t.string "main_title"
    t.string "main_image"
    t.string "main_link"
    t.string "main_description"
    t.string "sub_title_01"
    t.string "sub_title_02"
    t.string "sub_title_03"
    t.string "sub_title_04"
    t.string "sub_title_05"
    t.string "sub_image_01"
    t.string "sub_image_02"
    t.string "sub_image_03"
    t.string "sub_image_04"
    t.string "sub_image_05"
    t.string "sub_link_01"
    t.string "sub_link_02"
    t.string "sub_link_03"
    t.string "sub_link_04"
    t.string "sub_link_05"
    t.decimal "sub_is_price_01"
    t.decimal "sub_is_price_02"
    t.decimal "sub_is_price_03"
    t.decimal "sub_is_price_04"
    t.decimal "sub_is_price_05"
    t.decimal "sub_was_price_01"
    t.decimal "sub_was_price_02"
    t.decimal "sub_was_price_03"
    t.decimal "sub_was_price_04"
    t.decimal "sub_was_price_05"
    t.decimal "sub_pct_01"
    t.decimal "sub_pct_02"
    t.decimal "sub_pct_03"
    t.decimal "sub_pct_04"
    t.decimal "sub_pct_05"
    t.string "h_spare_01"
    t.string "h_spare_02"
    t.string "h_spare_03"
    t.string "h_spare_04"
    t.string "h_spare_05"
    t.string "h_spare_06"
    t.string "h_spare_07"
    t.string "h_spare_08"
    t.string "h_spare_09"
    t.string "h_spare_10"
    t.string "h_spare_11"
    t.string "h_spare_12"
    t.string "h_spare_13"
    t.string "h_spare_14"
    t.string "h_spare_15"
    t.text "h_spare_31"
    t.text "h_spare_32"
    t.float "h_spare_41"
    t.float "h_spare_42"
    t.float "h_spare_43"
    t.float "h_spare_44"
    t.float "h_spare_45"
    t.integer "h_spare_56"
    t.integer "h_spare_57"
    t.integer "h_spare_58"
    t.integer "h_spare_59"
    t.integer "h_spare_60"
    t.decimal "h_spare_61"
    t.decimal "h_spare_62"
    t.decimal "h_spare_63"
    t.decimal "h_spare_64"
    t.decimal "h_spare_65"
    t.datetime "h_spare_66"
    t.datetime "h_spare_67"
    t.datetime "h_spare_68"
    t.date "h_spare_71"
    t.date "h_spare_72"
    t.date "h_spare_73"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "onedays", force: :cascade do |t|
    t.integer "user_id"
    t.string "o_title"
    t.string "o_link"
    t.string "o_image"
    t.string "o_promocode"
    t.float "o_rating"
    t.integer "o_rating_code"
    t.float "o_review_count"
    t.string "o_year"
    t.string "o_month"
    t.string "o_day"
    t.decimal "o_is_price"
    t.decimal "o_was_price"
    t.decimal "o_pct"
    t.decimal "o_cash_coupon"
    t.decimal "o_pct_coupon"
    t.text "o_description"
    t.string "o_spare_01"
    t.string "o_spare_02"
    t.string "o_spare_03"
    t.string "o_spare_04"
    t.string "o_spare_05"
    t.float "o_spare_41"
    t.float "o_spare_42"
    t.integer "o_spare_56"
    t.integer "o_spare_57"
    t.decimal "o_spare_61"
    t.decimal "o_spare_62"
    t.datetime "o_spare_66"
    t.datetime "o_spare_67"
    t.date "o_spare_71"
    t.date "o_spare_72"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.integer "p_integer_01"
    t.integer "p_integer_02"
    t.integer "p_integer_03"
    t.integer "p_integer_04"
    t.integer "p_integer_05"
    t.integer "p_integer_06"
    t.integer "p_integer_07"
    t.integer "p_integer_08"
    t.integer "p_integer_09"
    t.integer "p_integer_10"
    t.integer "p_integer_11"
    t.integer "p_integer_12"
    t.integer "p_integer_13"
    t.integer "p_integer_14"
    t.integer "p_integer_15"
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

  create_table "punches", force: :cascade do |t|
    t.integer "punchable_id", null: false
    t.string "punchable_type", limit: 20, null: false
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.datetime "average_time", null: false
    t.integer "hits", default: 1, null: false
    t.index ["average_time"], name: "index_punches_on_average_time"
    t.index ["punchable_type", "punchable_id"], name: "punchable_index"
  end

  create_table "savings", force: :cascade do |t|
    t.integer "user_id"
    t.string "s_title"
    t.string "s_link"
    t.string "s_image"
    t.string "s_promocode"
    t.float "s_rating"
    t.integer "s_rating_code"
    t.float "s_review_count"
    t.decimal "s_is_price"
    t.decimal "s_was_price"
    t.decimal "s_pct"
    t.decimal "s_cash_coupon"
    t.decimal "s_pct_coupon"
    t.text "s_description"
    t.string "s_spare_01"
    t.string "s_spare_02"
    t.string "s_spare_03"
    t.string "s_spare_04"
    t.string "s_spare_05"
    t.float "s_spare_41"
    t.float "s_spare_42"
    t.integer "s_spare_56"
    t.integer "s_spare_57"
    t.decimal "s_spare_61"
    t.decimal "s_spare_62"
    t.datetime "s_spare_66"
    t.datetime "s_spare_67"
    t.date "s_spare_71"
    t.date "s_spare_72"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "search_entries", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "image"
    t.string "source"
    t.string "hashtag"
    t.string "promocode"
    t.string "rating"
    t.string "rating_code"
    t.string "review_count"
    t.string "is_price"
    t.string "was_price"
    t.string "pct"
    t.string "pct_coupon"
    t.string "cash_coupon"
    t.text "description"
    t.string "searchable_type", null: false
    t.integer "searchable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["searchable_type", "searchable_id"], name: "index_search_entries_on_searchable"
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

  add_foreign_key "coupons_tags", "coupons"
  add_foreign_key "coupons_tags", "tags"
  add_foreign_key "picks_tags", "picks"
  add_foreign_key "picks_tags", "tags"
  add_foreign_key "posts_tags", "posts"
  add_foreign_key "posts_tags", "tags"
end
