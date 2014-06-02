class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :course_id
      t.date :start_date
      t.date :due_date
      t.integer :max_points
      t.string :description

      t.timestamps
    end
  end
end
