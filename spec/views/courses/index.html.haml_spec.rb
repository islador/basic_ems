require 'spec_helper'

describe "courses/index.html.haml" do
	let!(:course) {FactoryGirl.create(:course)}
	let!(:course1) {FactoryGirl.create(:course)}
	let!(:student) {FactoryGirl.create(:student)}

	subject {page}

	before(:each) do
		visit student_courses_path(student)
	end

	it "should have a table" do
		should have_selector('table#courses_table')
	end

	it "should have a row for each course" do
		within 'table#courses_table tbody' do
			should have_selector("tr#course_#{course.id}")
			should have_selector("tr#course_#{course1.id}")
			should_not have_selector("tr#course_999999999")
		end
		#page.all("tbody tr").count.should eql(1)

		#find("tbody tr").count.should eql(1)
		#page.all("tr").count.should eql(1)
	end

	xit "should paginate the table" do
	end

	it "should display the course name" do
		within '#courses_table' do
			should have_selector("td#course_#{course.id}_name", text: course.name)
		end
	end

	it "should contain an 'enroll' button for each class" do
		within '#courses_table' do
			should have_selector("td input#enroll_course_#{course.id}")
		end
	end

	xit "clicking the enroll button should create an enrolled_student between the course and the student" do
		click_button('Enroll in Course')
		course.enrolled_students[0].student.id.should be student.id
	end
end
