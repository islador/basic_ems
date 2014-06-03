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

require 'spec_helper'

describe EnrolledStudent do
	let(:student) {FactoryGirl.create(:student)}
	let(:course) {FactoryGirl.create(:course)}
	let!(:enrolled_student) {FactoryGirl.create(:enrolled_student, student: student, course: course)}

	subject {enrolled_student}

	it {should respond_to(:total_earned_points)}

	it {should be_valid}

	describe "Associations > " do
		describe "Course > " do
			it {should respond_to(:course)}
			it {should respond_to(:student)}

			it "should have a course" do
				enrolled_student.course.should_not be_nil
			end

			it "should have course as its course" do
				enrolled_student.course.id.should be course.id
			end

			it "should have a student" do
				enrolled_student.student.should_not be_nil
			end

			it "should have student be its student" do
				enrolled_student.student.id.should be student.id
			end
		end

		describe "Enrolled Student Assignments > " do
			let(:assignment){FactoryGirl.create(:assignment, course: course)}
			let!(:enrolled_student_assignment) {FactoryGirl.create(:enrolled_student_assignment, enrolled_student: enrolled_student, assignment: assignment)}
			it {should respond_to(:enrolled_student_assignments)}
			it "should have enrolled student assignments" do
				enrolled_student.enrolled_student_assignments.should_not be_nil
			end

			it "should have the correct enrolled_student_assignment" do
				enrolled_student.enrolled_student_assignments[0].id.should be enrolled_student_assignment.id
			end

			it {should respond_to(:assignments)}

			it "should have assignments" do
				enrolled_student.assignments.should_not be_nil
			end

			it "should have the correct assignments" do
				enrolled_student.assignments[0].id.should be assignment.id
			end
		end
	end

	describe "Callbacks > " do
		let!(:assignment) {FactoryGirl.create(:assignment, course: course)}
		it "should make an enrolled_student_assignment for each of the course' assignments" do
			expect{
				EnrolledStudent.create(student_id: student.id, course_id: course.id)
				}.to change(EnrolledStudentAssignment, :count).by(+1)
		end
	end
end
