require 'spec_helper'

describe "courses/new.html.haml" do
	subject {page}

	before(:each) do
		visit new_course_path
	end

	it "should have a form to enter a new Course's name" do
		should have_selector('input#course_name')
	end

	it "should have a button to submit the new course" do
		should have_selector('input#submit_new_course')
	end

	it "should create a new course when the submit_new_course button is clicked" do
		fill_in('Name', :with => "Advanced Psych")
		expect{
			click_button('Create New Course')
		}.to change(Course, :count).by(+1)
	end
end
