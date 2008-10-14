class CreateBookshelves < ActiveRecord::Migration
  def self.up
    create_table :bookshelves do |t|
      t.column :user_id, :integer
      t.column :book_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :bookshelves
  end
end
