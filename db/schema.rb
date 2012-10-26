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

ActiveRecord::Schema.define(:version => 20121025095854) do

  create_table "exports", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.string   "sk_invoice_id"
    t.integer  "user_id"
    t.integer  "export_id"
    t.date     "exported_at"
    t.integer  "counter_account"
    t.string   "debitor"
    t.string   "creditor"
    t.float    "amount"
    t.string   "wkz_turnover"
    t.integer  "tax"
    t.integer  "account_number"
    t.date     "date"
    t.string   "sheet_field_1"
    t.string   "sheet_field_2"
    t.integer  "skonto"
    t.text     "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "sk_user_id"
    t.string   "sk_company_id"
    t.string   "sk_access_token"
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
