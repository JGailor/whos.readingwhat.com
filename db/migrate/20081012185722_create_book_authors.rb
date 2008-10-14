class CreateBookAuthors < ActiveRecord::Migration
  def self.up
    create_table :book_authors do |t|
      t.column :author_id, :integer
      t.column :book_id, :integer
    end
  end

  def self.down
    drop_table :book_authors
  end
end
