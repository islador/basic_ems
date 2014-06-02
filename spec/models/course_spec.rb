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
			course.enrolled_students[0].id.should be enrolled_student.id
		end

		it "should have students" do
			course.students.should_not be_nil
		end

		it "should have student as a student" do
			course.students[0].id.should be student.id
		end
	end
end
