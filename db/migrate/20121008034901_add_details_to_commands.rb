class AddDetailsToCommands < ActiveRecord::Migration
  def up 
    add_column :commands, :command, :string
    add_column :commands, :detail, :text
  end
  def down 
    remove_column :commands, :command
    remove_column :commands, :detail
  end
end

