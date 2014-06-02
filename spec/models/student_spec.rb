# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Student do
	let!(:student) {FactoryGirl.create(:student)}

	subject{student}

	it{should respond_to(:name)}
	it{should be_valid}

	describe "Associations > " do
		let(:course) {FactoryGirl.create(:course)}
		let!(:enrolled_student) {FactoryGirl.create(:enrolled_student, student: student, course: course)}

		it {should respond_to(:enrolled_students)}
		it {should respond_to(:courses)}

		it "should have an enrolled student" do
			student.enrolled_students.count.should be >0
		end

		it "should have enrolled_student as an enrolled student" do
			student.enrolled_students[0].id.should be enrolled_student.id
		end

		it "should have courses" do
			student.courses.should_not be_nil
		end

		it "should have course as a course" do
			student.courses[0].id.should be course.id
		end
	end
end
