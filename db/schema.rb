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

ActiveRecord::Schema.define(:version => 20081016162711) do

  create_table "authors", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_authors", :force => true do |t|
    t.integer "author_id"
    t.integer "book_id"
  end

  create_table "book_covers", :force => true do |t|
    t.integer  "album_id"
    t.integer  "parent_id"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "book_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.integer  "pages"
    t.date     "publication_date"
    t.string   "isbn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookshelf_books", :force => true do |t|
    t.integer  "bookshelf_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookshelves", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email_address",  :null => false
    t.string   "password",       :null => false
    t.string   "nickname"
    t.datetime "last_logged_in"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
