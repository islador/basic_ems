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
#

require 'spec_helper'

describe Assignment do
	let(:course) {FactoryGirl.create(:course)}
	let!(:assignment) {FactoryGirl.create(:assignment, course: course)}

	subject {assignment}

	it {should respond_to(:start_date)}
	it {should respond_to(:due_date)}
	it {should respond_to(:max_points)}
	it {should respond_to(:description)}

	it {should be_valid}

	describe "Associations > " do
		describe "Course > " do
			it {should respond_to(:course)}

			it "should have a course" do
				assignment.course.should_not be_nil
			end

			it "should have course as its course" do
				assignment.course.id.should be course.id
			end
		end


		describe " Enrolled Student Assignments > " do
			let!(:enrolled_student_assignment) {FactoryGirl.create(:enrolled_student_assignment, assignment: assignment)}

			it {should respond_to(:enrolled_student_assignments)}

			it "should have enrolled student assignments" do
				assignment.enrolled_student_assignments.should_not be_nil
			end

			it "should have the correct enrolled_student_assignment" do
				assignment.enrolled_student_assignments[0].id.should be enrolled_student_assignment.id
			end
		end
	end
end
