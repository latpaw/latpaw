class AddVideo2ToPosts < ActiveRecord::Migration
  def self.up
    add_attachment :posts, :video2
  end

  def self.down
    remove_attachment :posts, :video2
  end
end

