require 'spec_helper'

describe "courses/show.html.haml" do
	let!(:course) {FactoryGirl.create(:course)}
	let!(:student) {FactoryGirl.create(:student)}

	subject {page}

	before(:each) do
		visit student_course_path(student, course)
	end

	it "should have the course's name" do
		should have_selector('#course_name', text: course.name)
	end

	it "should have a button to delete the course" do
		should have_button('Delete Course')
	end

	it "should delete the course when the delete button is pressed" do
		click_button('Delete Course')
		Course.where("id = ?", course.id)[0].should be_nil
	end

	it "should have a button to add a new assignment to the course" do
		should have_button('Create New Assignment')
	end

	it "should go to the new assignments page when the 'Create New Assignment' button is pressed" do
		click_button('Create New Assignment')
		should have_selector("input#submit_new_assignment")
	end
end
