class AddFile2ToPosts < ActiveRecord::Migration
  def self.up
    add_attachment :posts, :file2
  end

  def self.down
    remove_attachment :posts, :file2
  end
end
