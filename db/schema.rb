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

ActiveRecord::Schema.define(:version => 20130402192121) do

  create_table "remembers", :force => true do |t|
    t.string   "name"
    t.string   "tags"
    t.text     "short_desc"
    t.text     "full_desc"
    t.string   "ref_name"
    t.boolean  "active"
    t.string   "ref_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "tag"
    t.integer  "Remember_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "word_variation_id"
  end

  add_index "tags", ["Remember_id"], :name => "index_tags_on_Remember_id"
  add_index "tags", ["tag"], :name => "index_tags_on_tag"

  create_table "unique_words", :force => true do |t|
    t.string   "unique_word"
    t.string   "unique_word_desc"
    t.string   "language"
    t.string   "word_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "unique_words", ["language"], :name => "index_unique_words_on_language"
  add_index "unique_words", ["unique_word"], :name => "index_unique_words_on_unique_word"
  add_index "unique_words", ["word_type"], :name => "index_unique_words_on_word_type"

  create_table "word_variations", :force => true do |t|
    t.string   "variation_word"
    t.string   "unique_word"
    t.string   "variation_word_desc"
    t.integer  "unique_word_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "word_variations", ["unique_word"], :name => "index_word_variations_on_unique_word"
  add_index "word_variations", ["unique_word_id"], :name => "index_word_variations_on_unique_word_id"
  add_index "word_variations", ["variation_word"], :name => "index_word_variations_on_variation_word"

end
