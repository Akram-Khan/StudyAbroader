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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120330073454) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "activitystreams", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "recipient_id"
    t.string   "verb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_messagings", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_messagings", ["user_id"], :name => "index_admin_messagings_on_user_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "blocklists", :force => true do |t|
    t.integer  "blocked_user"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blocklists", ["user_id"], :name => "index_blocklists_on_user_id"

  create_table "blogcomments", :force => true do |t|
    t.text     "comment"
    t.integer  "blog_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogcomments", ["blog_id"], :name => "index_blogcomments_on_blog_id"
  add_index "blogcomments", ["user_id"], :name => "index_blogcomments_on_user_id"

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count", :default => 0
  end

  add_index "blogs", ["user_id"], :name => "index_blogs_on_user_id"

  create_table "conversations", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destination_photos", :force => true do |t|
    t.string   "picture"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "destination_photos", ["destination_id"], :name => "index_destination_photos_on_destination_id"

  create_table "destination_videos", :force => true do |t|
    t.text     "embed_video"
    t.text     "description"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "destination_videos", ["destination_id"], :name => "index_destination_videos_on_destination_id"

  create_table "destinations", :force => true do |t|
    t.string   "continent"
    t.string   "country"
    t.string   "name"
    t.text     "fun_facts"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.boolean  "preferred",  :default => false
  end

  create_table "forums", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "category"
    t.string   "continent"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "home_elements", :force => true do |t|
    t.string   "slideshow_first_slide_heading",      :default => "Meet Study Abroaders"
    t.string   "slideshow_first_slide_description",  :default => "This is the first slide placeholder"
    t.string   "slideshow_second_slide_heading",     :default => "Real Advice From Study Abroaders"
    t.string   "slideshow_second_slide_description", :default => "This is the second slide placeholder"
    t.string   "slideshow_third_slide_heading",      :default => "Share Your Experiences"
    t.string   "slideshow_third_slide_description",  :default => "This is the third slide placeholder"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slide1"
    t.string   "slide2"
    t.string   "slide3"
    t.text     "aboutus"
    t.text     "contactus"
    t.text     "privacy_policy"
    t.text     "terms_and_conditions"
    t.text     "confirmation_email"
  end

  create_table "messages", :force => true do |t|
    t.integer  "conversation_id"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "body"
    t.integer  "read",            :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], :name => "index_messages_on_conversation_id"
  add_index "messages", ["receiver_id"], :name => "index_messages_on_receiver_id"
  add_index "messages", ["sender_id"], :name => "index_messages_on_sender_id"

  create_table "postcomments", :force => true do |t|
    t.string   "comment"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postcomments", ["post_id"], :name => "index_postcomments_on_post_id"
  add_index "postcomments", ["user_id"], :name => "index_postcomments_on_user_id"

  create_table "posts", :force => true do |t|
    t.text     "content"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "posts", ["topic_id"], :name => "index_posts_on_topic_id"

  create_table "program_providers", :force => true do |t|
    t.string   "name"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "programpics"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "rich_rich_files", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        :default => "file"
  end

  create_table "submissions", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "published",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "submissions", ["user_id"], :name => "index_submissions_on_user_id"

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "country_name"
    t.string   "city"
    t.integer  "forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "topics", ["forum_id"], :name => "index_topics_on_forum_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "studyAbroadStatus"
    t.text     "whyIStudyAbroad"
    t.string   "avatar"
    t.boolean  "remove_avatar",                         :default => false
    t.string   "age"
    t.string   "languages"
    t.date     "studyAbroadDates"
    t.string   "studyAbroadProgram"
    t.string   "school"
    t.string   "studyAbroadCountry"
    t.string   "hometown"
    t.string   "favoriteCity"
    t.string   "nextDestination"
    t.integer  "points",                                :default => 15
    t.string   "facebook"
    t.string   "twitter"
    t.string   "blog"
    t.string   "linkedin"
    t.string   "flickr"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "fk_one_vote_per_user_per_entity", :unique => true
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
