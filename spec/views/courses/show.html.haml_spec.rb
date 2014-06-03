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
end
