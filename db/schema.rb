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

ActiveRecord::Schema.define(:version => 20120123140255) do

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

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "avaya_logs", :force => true do |t|
    t.string "star",      :limit => 45, :null => false
    t.string "duration",  :limit => 45
    t.string "caller",    :limit => 45
    t.string "calling",   :limit => 45
    t.string "direction", :limit => 45, :null => false
  end

  create_table "bind_sip_accounts", :force => true do |t|
    t.integer  "phone_id"
    t.integer  "sip_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "company"
  end

  create_table "context_rules", :force => true do |t|
    t.integer  "context_id"
    t.string   "exten"
    t.string   "priority"
    t.string   "app"
    t.string   "appdata"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contexts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_types", :force => true do |t|
    t.string   "name"
    t.boolean  "router"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fxo"
    t.integer  "lan"
    t.boolean  "wifi"
    t.string   "protocol"
    t.integer  "fxs"
    t.string   "price"
  end

  create_table "devices", :force => true do |t|
    t.string   "name"
    t.integer  "device_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
  end

  add_index "devices", ["device_type_id"], :name => "index_devices_on_device_type_id"

  create_table "directions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "extensions_table", :id => false, :force => true do |t|
    t.integer "id",       :default => 0, :null => false
    t.string  "context"
    t.string  "exten"
    t.string  "priority"
    t.string  "app"
    t.string  "appdata"
  end

  create_table "phone_codes", :force => true do |t|
    t.string   "coe"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "blocked"
    t.boolean  "record"
  end

  create_table "records", :force => true do |t|
    t.string   "name"
    t.datetime "date"
    t.datetime "time"
    t.string   "called"
    t.string   "calling"
    t.string   "link"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.integer  "direction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sip_accounts", :force => true do |t|
    t.string   "name",                                                                                                    :null => false
    t.string   "username",                                                                                                :null => false
    t.string   "context",                                                                                                 :null => false
    t.string   "secret",                                                                                                  :null => false
    t.string   "host",          :default => "dynamic",                                                                    :null => false
    t.string   "disallow",      :default => "all"
    t.string   "allow",         :default => "ulaw;alaw;g729;ilbc;gsm"
    t.string   "deny",          :default => "0.0.0.0/0.0.0.0"
    t.string   "permit",        :default => "89.255.64.0/24;89.255.65.0/24;89.255.66.0/24;89.255.67.0/24;89.255.68.0/24"
    t.string   "nat",           :default => "yes",                                                                        :null => false
    t.string   "qualify",       :default => "yes",                                                                        :null => false
    t.string   "t38pt_udptl",   :default => "no",                                                                         :null => false
    t.string   "callgroup"
    t.integer  "call_limit",    :default => 1
    t.string   "canreinvite",   :default => "yes"
    t.string   "dtmfmode",      :default => "auto"
    t.string   "ipaddr",        :default => "",                                                                           :null => false
    t.string   "mailbox"
    t.string   "pickupgroup"
    t.string   "port",          :default => "",                                                                           :null => false
    t.string   "regexten",      :default => "",                                                                           :null => false
    t.integer  "regseconds",    :default => 0,                                                                            :null => false
    t.string   "useclientcode", :default => "no"
    t.string   "fullcontact"
    t.string   "lastms"
    t.string   "useragent"
    t.string   "regserver"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "account_type"
    t.integer  "client_id"
    t.integer  "phone_id"
  end

  add_index "sip_accounts", ["name"], :name => "index_sip_accounts_on_name", :unique => true

  create_table "sip_buddies", :id => false, :force => true do |t|
    t.integer "id",            :default => 0,                                                                            :null => false
    t.string  "disallow",      :default => "all"
    t.string  "allow",         :default => "ulaw;alaw;g729;ilbc;gsm"
    t.string  "callgroup"
    t.integer "call-limit",    :default => 1
    t.string  "canreinvite",   :default => "yes"
    t.string  "context",                                                                                                 :null => false
    t.string  "dtmfmode",      :default => "auto"
    t.string  "host",          :default => "dynamic",                                                                    :null => false
    t.string  "ipaddr",        :default => "",                                                                           :null => false
    t.string  "mailbox"
    t.string  "name",                                                                                                    :null => false
    t.string  "nat",           :default => "yes",                                                                        :null => false
    t.string  "deny",          :default => "0.0.0.0/0.0.0.0"
    t.string  "permit",        :default => "89.255.64.0/24;89.255.65.0/24;89.255.66.0/24;89.255.67.0/24;89.255.68.0/24"
    t.string  "pickupgroup"
    t.string  "port",          :default => "",                                                                           :null => false
    t.string  "qualify",       :default => "yes",                                                                        :null => false
    t.string  "regexten",      :default => "",                                                                           :null => false
    t.integer "regseconds",    :default => 0,                                                                            :null => false
    t.string  "secret",                                                                                                  :null => false
    t.string  "t38pt_udptl",   :default => "no",                                                                         :null => false
    t.string  "type"
    t.string  "useclientcode", :default => "no"
    t.string  "username",                                                                                                :null => false
    t.string  "fullcontact"
    t.string  "lastms"
    t.string  "useragent"
    t.string  "regserver"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "zones", :primary_key => "code", :force => true do |t|
    t.string "name",  :limit => 45
    t.float  "price"
  end

end
