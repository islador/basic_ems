# == Schema Information
#
# Table name: enrolled_student_assignments
#
#  id                      :integer          not null, primary key
#  enrolled_student_id     :integer
#  assignment_id           :integer
#  earned_points           :integer
#  submit_date             :date
#  created_at              :datetime
#  updated_at              :datetime
#  submission_file_name    :string(255)
#  submission_content_type :string(255)
#  submission_file_size    :integer
#  submission_updated_at   :datetime
#

class EnrolledStudentAssignment < ActiveRecord::Base
	belongs_to :enrolled_student
	belongs_to :assignment

	has_one :student, through: :enrolled_student
	has_one :course, through: :assignment

	has_attached_file :submission
		do_not_validate_attachment_file_type :submission
end
