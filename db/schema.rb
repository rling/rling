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

ActiveRecord::Schema.define(:version => 20110409103040) do

  create_table "assets", :force => true do |t|
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 1,  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "form_components", :force => true do |t|
    t.integer  "object_form_id"
    t.string   "component_name"
    t.string   "component_type"
    t.text     "component_values"
    t.string   "default_value"
    t.boolean  "mandatory",              :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "component_display_name"
    t.integer  "position",               :default => 0
  end

  create_table "form_data", :force => true do |t|
    t.integer  "form_component_id"
    t.string   "data_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "form_submission_id"
  end

  create_table "form_submissions", :force => true do |t|
    t.integer  "object_form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailers", :force => true do |t|
    t.string   "handle"
    t.string   "subject"
    t.text     "body"
    t.boolean  "is_deletable", :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.integer  "position",         :default => 0
    t.integer  "level",            :default => 0
    t.string   "image_path"
    t.string   "hover_image_path"
    t.string   "link_path"
    t.integer  "parent_id",        :default => 0
    t.integer  "menuset_id"
    t.integer  "page_id"
    t.integer  "menu_view_type",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menusets", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "model_components", :force => true do |t|
    t.integer  "object_model_id"
    t.string   "component_name"
    t.string   "component_display_name"
    t.string   "component_type"
    t.text     "component_values"
    t.text     "default_value"
    t.boolean  "is_mandatory",           :default => false
    t.boolean  "is_deletable",           :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",               :default => 0
  end

  create_table "model_data", :force => true do |t|
    t.integer  "model_component_id"
    t.integer  "model_submission_id"
    t.string   "data_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "model_submissions", :force => true do |t|
    t.integer  "object_model_id"
    t.string   "perma_link"
    t.boolean  "home_page"
    t.integer  "page_view_type",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "object_models", :force => true do |t|
    t.string   "name"
    t.string   "perma_link_parent"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_variable_settings", :force => true do |t|
    t.string   "name"
    t.text     "default_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_variables", :force => true do |t|
    t.integer  "page_id"
    t.integer  "page_variable_setting_id"
    t.text     "variable_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pagelets", :force => true do |t|
    t.string   "handle"
    t.text     "display_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "perma_link"
    t.boolean  "home_page",                  :default => false
    t.integer  "page_view_type",             :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "type"
    t.string   "view_type"
    t.integer  "view_for"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.boolean  "allow_create_on_permission", :default => false
  end

  create_table "permission_roles", :force => true do |t|
    t.integer  "permission_id"
    t.integer  "role_id"
    t.boolean  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.string   "permission_object"
    t.string   "permission_type"
    t.string   "activity_code"
    t.string   "activity_display_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "role_type"
    t.boolean  "is_deletable", :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "settings", :force => true do |t|
    t.string   "name"
    t.string   "desc_text"
    t.text     "setting_value"
    t.string   "setting_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_detail_settings", :force => true do |t|
    t.string   "field_name"
    t.string   "field_type"
    t.text     "field_values"
    t.string   "default_value"
    t.boolean  "mandatory",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",      :default => 0
  end

  create_table "user_details", :force => true do |t|
    t.integer  "user_id"
    t.integer  "user_detail_setting_id"
    t.text     "selected_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                 :null => false
    t.string   "email",                                 :null => false
    t.integer  "role_id"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "activation_key"
    t.boolean  "is_activated",       :default => false
    t.string   "reset_password_key"
    t.integer  "login_count",        :default => 0
    t.integer  "failed_login_count", :default => 0
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["login"], :name => "index_users_on_login"

  create_table "view_components", :force => true do |t|
    t.integer  "view_id"
    t.string   "name"
    t.boolean  "is_linked",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",     :default => 0
    t.string   "display_name"
  end

end
