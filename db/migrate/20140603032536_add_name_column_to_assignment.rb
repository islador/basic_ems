class AddNameColumnToAssignment < ActiveRecord::Migration
  def up
  	add_column :assignments, :name, :string
  end
  def down
  	remove_column :assignments, :name, :string
  end
end
