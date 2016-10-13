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

ActiveRecord::Schema.define(version: 20161009124530) do

  create_table "documents", force: :cascade do |t|
    t.integer  "shipment_id"
    t.integer  "checklist_id"
    t.string   "title"
    t.string   "path"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["shipment_id"], name: "index_documents_on_shipment_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.string   "marketer"
    t.string   "product"
    t.date     "arrived_at"
    t.string   "mother_vessel"
    t.date     "mother_vessel_bl"
    t.string   "jetty"
    t.string   "daughter_vessel"
    t.date     "daughter_vessel_bl"
    t.string   "receiving_depot"
    t.date     "shore_receipt_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
