require 'spec_helper'

describe "student/show.html.haml" do
	let!(:student) {FactoryGirl.create(:student)}
	
	subject {page}

	before(:each) do
		visit student_path(student)
	end

	it "should have the student's name" do
		should have_selector('#student_name', text: student.name)
	end

	it "should have a button to delete the student" do
		should have_button('Delete Student')
	end

	it "should delete the student when the delete button is pressed" do
		click_button('Delete Student')
		Student.where("id = ?", student.id)[0].should be_nil
	end
end
