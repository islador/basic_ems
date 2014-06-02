# == Schema Information
#
# Table name: enrolled_student_assignments
#
#  id                  :integer          not null, primary key
#  enrolled_student_id :integer
#  assignment_id       :integer
#  earned_points       :integer
#  submit_date         :date
#  created_at          :datetime
#  updated_at          :datetime
#

class EnrolledStudentAssignment < ActiveRecord::Base
	belongs_to :enrolled_student
	belongs_to :assignment

	has_one :student, through: :enrolled_student
	has_one :course, through: :assignment
end
