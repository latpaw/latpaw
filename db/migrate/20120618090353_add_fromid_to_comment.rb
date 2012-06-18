class AddFromidToComment < ActiveRecord::Migration
  def change
    add_column :comments, :fromid, :integer
  end
end
