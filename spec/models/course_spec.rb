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

require 'spec_helper'

describe Course do
	let!(:course) {FactoryGirl.create(:course)}

	subject{course}

	it {should respond_to(:start_date)}
	it {should respond_to(:end_date)}
	it {should respond_to(:teacher_id)}
	it {should respond_to(:max_points)}
	it {should respond_to(:name)}

	it {should be_valid}

	describe "Associations > " do
		let!(:assignment_1) {FactoryGirl.create(:assignment, course: course)}
		let!(:assignment_2) {FactoryGirl.create(:assignment, course: course)}

		it {should respond_to(:assignments)}

		it "should have an assignment" do
			course.assignments.should_not be_nil
		end

		it "should have assignement_1 as an assignment" do
			course.assignments[0].id.should be assignment_1.id
		end

		it "should have assignement_2 as an assignment" do
			course.assignments[1].id.should be assignment_2.id
		end

		let(:student) {FactoryGirl.create(:student)}
		let!(:enrolled_student) {FactoryGirl.create(:enrolled_student, course: course, student: student)}
		it {should respond_to(:enrolled_students)}
		it {should respond_to(:students)}

		it "should have an enrolled student" do
			course.enrolled_students.count.should be >0
		end

		it "should have enrolled_student as an enrolled student" do
			course.enrolled_students.where("id = ?", enrolled_student.id)[0].should eq(enrolled_student)
		end

		it "should have students" do
			course.students.should_not be_nil
		end

		it "should have student as a student" do
			course.students[0].id.should be student.id
		end
	end

	describe "propagate_assignment > " do
		let!(:enrolled_student2) {FactoryGirl.create(:enrolled_student, course: course)}
		let!(:enrolled_student3) {FactoryGirl.create(:enrolled_student, course: course)}
		let!(:wrong_enrolled_student) {FactoryGirl.create(:enrolled_student)}
		let!(:assignment) {FactoryGirl.create(:assignment)}

		it {should respond_to(:propagate_assignment)}

		it "should create an enrolled_student_assignment for each of its enrolled_students" do
			expect{
				course.propagate_assignment(assignment)
			}.to change(EnrolledStudentAssignment, :count).by(+2)
		end

		#Test ensures that non-affiliated students do not receive an assignment
		it "should not create an enrolled_student_assignment for students that aren't enrolled in it" do
			expect{
				course.propagate_assignment(assignment)
			}.to change(wrong_enrolled_student.enrolled_student_assignments, :count).by(0)
		end
	end

end
