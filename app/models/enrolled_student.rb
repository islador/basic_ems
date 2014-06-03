# == Schema Information
#
# Table name: enrolled_students
#
#  id                  :integer          not null, primary key
#  student_id          :integer
#  course_id           :integer
#  total_earned_points :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class EnrolledStudent < ActiveRecord::Base
	belongs_to :student
	belongs_to :course

	has_many :enrolled_student_assignments
	has_many :assignments, through: :enrolled_student_assignments

	after_save :copy_assignments

	private
	#This is likely to be heavily blocking, and would ideally be shuttled off to an async worker.
	#Duplicate all of the course's assignments to the new student
	def copy_assignments
		course_assignments = self.course.assignments
		course_assignments.each do |assignment|
			self.enrolled_student_assignments.create(assignment_id: assignment.id)
		end
	end
end
