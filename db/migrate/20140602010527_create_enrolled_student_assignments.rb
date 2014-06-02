class CreateEnrolledStudentAssignments < ActiveRecord::Migration
  def change
    create_table :enrolled_student_assignments do |t|
      t.integer :enrolled_student_id
      t.integer :assignment_id
      t.integer :earned_points
      t.date :submit_date

      t.timestamps
    end
  end
end
