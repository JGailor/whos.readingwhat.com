class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :email_address, :string, :null => false
      t.column :password, :string, :null => false
      t.column :nickname, :string, :null => true
      t.column :last_logged_in, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
