require 'spec_helper'

describe "assignments/index.html.haml" do
	let(:course) {FactoryGirl.create(:course)}
	let!(:student) {FactoryGirl.create(:student)}
	let!(:assignment) {FactoryGirl.create(:assignment, course: course)}
	let!(:assignment1) {FactoryGirl.create(:assignment, course: course)}

	subject {page}

	before(:each) do
		visit student_course_assignments_path(student, course)
	end

	it "should have a table" do
		should have_selector('table#course_assignments_table')
	end

	it "should have a row for each assignment" do
		within 'table#course_assignments_table tbody' do
			should have_selector("tr#assignment_#{assignment.id}")
			should have_selector("tr#assignment_#{assignment1.id}")
			should_not have_selector("tr#assignment_999999999")
		end
	end

	xit "should paginate the table" do
	end

	it "should display the assignment name" do
		within '#course_assignments_table' do
			should have_selector("td#assignment_#{assignment.id}_name", text: assignment.name)
		end
	end

	it "should contain a 'delete' button for each assignment" do
		within '#course_assignments_table' do
			should have_selector("td input#delete_assignment_#{assignment.id}")
		end
	end
end
