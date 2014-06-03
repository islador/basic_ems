require 'spec_helper'

describe "assignments/show.html.haml" do
  let(:course) {FactoryGirl.create(:course)}
  let!(:assignment) {FactoryGirl.create(:assignment, course: course)}
  let!(:student) {FactoryGirl.create(:student)}

  subject {page}

  before(:each) do
  	visit student_course_assignment_path(student, course, assignment)
  end

  it "should have the assignment's name" do
  	should have_selector("#assignment_name", text: assignment.name)
  end

  it "should have a button to delete the assignment" do
  	should have_button('Delete Assignment')
  end

  it "should delete the assignment when the delete button is pressed" do
  	Assignment.where("id = ?", assignment.id)[0].should_not be_nil
  	click_button('Delete Assignment')
  	Assignment.where("id = ?", assignment.id)[0].should be_nil
  end
end
