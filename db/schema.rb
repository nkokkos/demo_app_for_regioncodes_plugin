# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100205105610) do
  
  create_table "names", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "geographical_region"
    t.string   "department"
    t.string   "municipality"
    t.string   "admin_district"
    t.string   "commune"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regioncodes", :force => true do |t|
    t.integer "code_index"
    t.string  "code"
    t.string  "description"
  end

end
