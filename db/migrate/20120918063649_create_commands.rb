class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.integer :id
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
