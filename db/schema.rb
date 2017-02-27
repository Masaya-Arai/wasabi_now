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

ActiveRecord::Schema.define(version: 0) do

  create_table "articles", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "page_id",       limit: 3,  null: false, unsigned: true
    t.string  "hash_code",     limit: 32
    t.integer "registered_at",            null: false, unsigned: true
    t.index ["hash_code"], name: "hash", unique: true, using: :btree
    t.index ["page_id"], name: "page_id", unique: true, using: :btree
  end

  create_table "categories", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",          limit: 16, default: "", null: false
    t.integer "registered_at",                         null: false, unsigned: true
  end

  create_table "feeds", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "site_id",                      limit: 1,                   null: false,                                            unsigned: true
    t.integer "category_id",                  limit: 1,                   null: false,                                            unsigned: true
    t.string  "url",                          limit: 256, default: ""
    t.string  "thumbnail_attribute",          limit: 128, default: ""
    t.string  "thumbnail_selector",           limit: 128, default: ""
    t.string  "thumbnail_caption_selector",   limit: 128, default: ""
    t.string  "thumbnail_copyright_selector", limit: 128, default: ""
    t.string  "content_selector",             limit: 256, default: ""
    t.string  "copyright_selector",           limit: 128, default: ""
    t.boolean "crawler_status",                           default: false, null: false, comment: "1=active,0=passive,-1=disabled"
    t.boolean "scraper_status",                           default: true,  null: false,                                            unsigned: true
    t.boolean "do_redirect",                              default: false, null: false,                                            unsigned: true
    t.boolean "do_need_js",                               default: false, null: false,                                            unsigned: true
    t.integer "registered_at",                                            null: false,                                            unsigned: true
  end

  create_table "page_contents", primary_key: "page_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "content",       limit: 4294967295, null: false
    t.integer "registered_at",                    null: false, unsigned: true
  end

  create_table "page_thumbnails", primary_key: "page_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "url",           limit: 512,  default: "", null: false
    t.string  "caption",       limit: 1024
    t.string  "copyright",     limit: 128
    t.integer "registered_at",                           null: false, unsigned: true
  end

  create_table "pages", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "feed_id",       limit: 2,                    null: false,                                 unsigned: true
    t.string  "url",           limit: 767,  default: "",    null: false, collation: "latin1_general_ci"
    t.string  "title",         limit: 256,  default: "",    null: false
    t.string  "description",   limit: 1024, default: ""
    t.string  "copyright",     limit: 128,  default: ""
    t.boolean "has_thumbnail",              default: false, null: false,                                 unsigned: true
    t.boolean "is_scraped",                 default: false, null: false,                                 unsigned: true
    t.integer "published_at",                               null: false,                                 unsigned: true
    t.integer "updated_at",                                 null: false,                                 unsigned: true
    t.integer "registered_at",                              null: false,                                 unsigned: true
    t.index ["url"], name: "page_url", unique: true, using: :btree
  end

  create_table "queues", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",  limit: 64, default: "", null: false
    t.integer "queue",                         null: false, unsigned: true
  end

  create_table "sites", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",          limit: 64, default: "", null: false
    t.integer "registered_at",                         null: false, unsigned: true
  end

end
