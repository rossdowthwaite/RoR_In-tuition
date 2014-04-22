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

ActiveRecord::Schema.define(version: 20140418155721) do

  create_table "appointments", force: true do |t|
    t.integer  "user_id"
    t.integer  "booking_id"
    t.boolean  "owner"
    t.boolean  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  add_index "appointments", ["booking_id"], name: "index_appointments_on_booking_id"
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id"

  create_table "bookings", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.date     "start"
    t.date     "end"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "booker_id"
  end

  add_index "bookings", ["booker_id"], name: "index_bookings_on_booker_id"

  create_table "class_rooms", force: true do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "class_rooms", ["course_id"], name: "index_class_rooms_on_course_id"
  add_index "class_rooms", ["student_id"], name: "index_class_rooms_on_student_id"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "course_bookings", force: true do |t|
    t.integer  "course_id"
    t.integer  "booking_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_bookings", ["booking_id"], name: "index_course_bookings_on_booking_id"
  add_index "course_bookings", ["course_id"], name: "index_course_bookings_on_course_id"

  create_table "course_contents", force: true do |t|
    t.integer  "subject_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_contents", ["course_id"], name: "index_course_contents_on_course_id"
  add_index "course_contents", ["subject_id"], name: "index_course_contents_on_subject_id"

  create_table "course_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "course_id"
    t.boolean  "show_in_profile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_items", ["course_id"], name: "index_course_items_on_course_id"
  add_index "course_items", ["product_id"], name: "index_course_items_on_product_id"

  create_table "courses", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "active"
    t.string   "search_tags"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrolments", force: true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrolments", ["course_id"], name: "index_enrolments_on_course_id"
  add_index "enrolments", ["student_id"], name: "index_enrolments_on_student_id"

  create_table "forum_contributors", force: true do |t|
    t.integer  "user_id"
    t.integer  "forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forum_contributors", ["forum_id"], name: "index_forum_contributors_on_forum_id"
  add_index "forum_contributors", ["user_id"], name: "index_forum_contributors_on_user_id"

  create_table "forum_posts", force: true do |t|
    t.integer  "forum_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forum_posts", ["forum_id"], name: "index_forum_posts_on_forum_id"
  add_index "forum_posts", ["post_id"], name: "index_forum_posts_on_post_id"

  create_table "forums", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "administrator_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "forumable_id"
    t.string   "forumable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forums", ["administrator_id"], name: "index_forums_on_administrator_id"

  create_table "goals", force: true do |t|
    t.integer  "user_id"
    t.string   "aim"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "locations", force: true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "county"
    t.string   "country"
    t.string   "p_code"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "materials", force: true do |t|
    t.integer  "topic_id"
    t.integer  "medium_id"
    t.string   "medium_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["topic_id"], name: "index_materials_on_topic_id"

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.integer  "receiver_id"
    t.string   "notifiable_type"
    t.integer  "notifiable_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "seen_at"
  end

  add_index "notifications", ["receiver_id"], name: "index_notifications_on_receiver_id"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "products", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "description"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id"

  create_table "profiles", force: true do |t|
    t.string   "bio"
    t.string   "profilable_type"
    t.integer  "profilable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qualifications", force: true do |t|
    t.integer  "user_id"
    t.string   "quality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "qualifications", ["user_id"], name: "index_qualifications_on_user_id"

  create_table "school_courses", force: true do |t|
    t.integer  "course_id"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "school_courses", ["course_id"], name: "index_school_courses_on_course_id"
  add_index "school_courses", ["school_id"], name: "index_school_courses_on_school_id"

  create_table "schools", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["user_id"], name: "index_schools_on_user_id"

  create_table "students", force: true do |t|
    t.integer  "user_id"
    t.integer  "pupil_id"
    t.string   "response"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["pupil_id"], name: "index_students_on_pupil_id"
  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "subject_topics", force: true do |t|
    t.integer  "subject_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subject_topics", ["subject_id"], name: "index_subject_topics_on_subject_id"
  add_index "subject_topics", ["topic_id"], name: "index_subject_topics_on_topic_id"

  create_table "subjects", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["user_id"], name: "index_subjects_on_user_id"

  create_table "texts", force: true do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "texts", ["user_id"], name: "index_texts_on_user_id"

  create_table "topics", force: true do |t|
    t.string   "title"
    t.string   "decription"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["user_id"], name: "index_topics_on_user_id"

  create_table "uploads", force: true do |t|
    t.string   "title"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "uploads", ["user_id"], name: "index_uploads_on_user_id"

  create_table "user_sessions", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "title"
    t.string   "username"
    t.string   "email"
    t.date     "dob"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin"
  end

  create_table "videos", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["user_id"], name: "index_videos_on_user_id"

  create_table "walls", force: true do |t|
    t.integer  "course_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "walls", ["course_id"], name: "index_walls_on_course_id"
  add_index "walls", ["post_id"], name: "index_walls_on_post_id"

end
