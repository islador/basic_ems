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

require 'spec_helper'

describe EnrolledStudentAssignment do
	let(:course) {FactoryGirl.create(:course)}
	let(:assignment) {FactoryGirl.create(:assignment, course: course)}
	let(:student) {FactoryGirl.create(:student)}
	let(:enrolled_student) {FactoryGirl.create(:enrolled_student, course: course, student: student)}
	let!(:enrolled_student_assignment) {FactoryGirl.create(:enrolled_student_assignment, assignment: assignment, enrolled_student: enrolled_student)}

	subject {enrolled_student_assignment}

	it {should respond_to(:earned_points)}
	it {should respond_to(:submit_date)}
	it {should be_valid}

	describe "Associations > " do
		it {should respond_to(:assignment)}
		it {should respond_to(:course)}
		
		it {should respond_to(:enrolled_student)}
		it {should respond_to(:student)}

		it "should have an assignment" do
			enrolled_student_assignment.assignment.should_not be_nil
		end

		it "should have the correct assignment" do
			enrolled_student_assignment.assignment.id.should be assignment.id
		end

		it "should have a course" do
			enrolled_student_assignment.course.should_not be_nil
		end

		it "should have the correct course" do
			enrolled_student_assignment.course.id.should be course.id
		end

		it "should have an enrolled_student" do
			enrolled_student_assignment.enrolled_student.should_not be_nil
		end

		it "should have the correct enrolled student" do
			enrolled_student_assignment.enrolled_student.id.should be enrolled_student.id
		end

		it "should have a student" do
			enrolled_student_assignment.student.should_not be_nil
		end

		it "should have the correct student" do
			enrolled_student_assignment.student.id.should be student.id
		end
	end
end
