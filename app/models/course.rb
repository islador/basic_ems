# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  start_date :date
#  end_date   :date
#  teacher_id :integer
#  max_points :integer
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

class Course < ActiveRecord::Base
	has_many :assignments
	has_many :enrolled_students
	has_many :students, through: :enrolled_students

	def propagate_assignment(assignment)
		#Heavyily blocking, should be moved to an async worker
		enrolled_students.each do |es|
			es.enrolled_student_assignments.create(assignment_id: assignment.id)
		end
	end

	
end
