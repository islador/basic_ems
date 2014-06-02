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
end
