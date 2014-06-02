class CreateEnrolledStudents < ActiveRecord::Migration
  def change
    create_table :enrolled_students do |t|
      t.integer :student_id
      t.integer :course_id
      t.integer :total_earned_points

      t.timestamps
    end
  end
end
