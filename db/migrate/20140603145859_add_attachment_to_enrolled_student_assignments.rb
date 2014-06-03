class AddAttachmentToEnrolledStudentAssignments < ActiveRecord::Migration
  def up
  	add_attachment :enrolled_student_assignments, :submission
  end
  def down
  	remove_attachment :enrolled_student_aassignments, :submission
  end
end
