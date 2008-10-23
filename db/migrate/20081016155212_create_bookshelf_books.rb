class CreateBookshelfBooks < ActiveRecord::Migration
  def self.up
    create_table :bookshelf_books do |t|
      t.column :bookshelf_id, :integer
      t.column :book_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :bookshelf_books
  end
end
