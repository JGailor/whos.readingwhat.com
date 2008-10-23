class CreateBookCovers < ActiveRecord::Migration
  def self.up
    create_table :book_covers do |t|
      t.integer :album_id, :parent_id, :size, :width, :height, :book_id
      t.string :content_type, :filename, :thumbnail
      t.timestamps
    end
  end

  def self.down
    drop_table :bookcovers
  end
end
