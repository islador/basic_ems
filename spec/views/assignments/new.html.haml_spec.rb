require 'spec_helper'

describe "assignments/new.html.haml" do
  let!(:course) {FactoryGirl.create(:course)}
  let!(:student) {FactoryGirl.create(:student)}

  subject {page}

  before(:each) do
  	visit new_student_course_assignment_path(student, course)
  end

  it "should have a form to enter a new assignment's information" do
  	should have_selector('input#assignment_name')
  	should have_selector('textarea#assignment_description')
  	should have_selector('input#assignment_max_points')
  	should have_selector('select#assignment_start_date_3i')
  	should have_selector('select#assignment_start_date_2i')
  	should have_selector('select#assignment_start_date_1i')
  	should have_selector('select#assignment_due_date_3i')
  	should have_selector('select#assignment_due_date_2i')
  	should have_selector('select#assignment_due_date_1i')
  end

  it "should have a button to submit the new assignment" do
  	should have_selector('input#submit_new_assignment')
  end

  it "should create a new assignment when the submit_new_assignment button is clicked" do
  	fill_in('Name', :with => "Ancient Greek Algorithms")
  	fill_in('Description', :with => "A study of ancient stuff")
  	fill_in('Max points', :with => "100")
  	expect{
  		click_button('Create New Assignment')
  	}.to change(Assignment, :count).by(+1)
  end
end
