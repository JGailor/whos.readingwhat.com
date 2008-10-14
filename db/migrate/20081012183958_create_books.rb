class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.column :title, :string
      t.column :pages, :integer
      t.column :publication_date, :date
      t.column :isbn, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
