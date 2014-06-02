require 'spec_helper'

describe "student/new.html.haml" do

	subject {page}

	before(:each) do
		visit new_student_path
	end

	it "should have a form to enter a new Student's name" do
		should have_selector('input#student_name')
	end

	it "should have a button to submit the new student form" do
		should have_selector("input#submit_new_student")
	end

	it "should create a new student when the submit_new_student button is clicked" do
		fill_in('Name', :with => "John")
		expect{
			click_button('Create New Student')
		}.to change(Student, :count).by(+1)
	end
end
