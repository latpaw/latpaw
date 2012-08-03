class AddNicknameToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :nickname, :string
  end
  def self.down
  	drop_column :users, :nickname, :string
  end
end
