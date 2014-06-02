class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.date :start_date
      t.date :end_date
      t.integer :teacher_id
      t.integer :max_points

      t.timestamps
    end
  end
end
