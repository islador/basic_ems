# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  course_id   :integer
#  start_date  :date
#  due_date    :date
#  max_points  :integer
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#

class Assignment < ActiveRecord::Base
	belongs_to :course

	has_many :enrolled_student_assignments
end
