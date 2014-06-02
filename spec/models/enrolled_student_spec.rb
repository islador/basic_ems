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
end
