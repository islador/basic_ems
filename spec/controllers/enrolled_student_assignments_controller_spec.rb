require 'spec_helper'

describe EnrolledStudentAssignmentsController do
  let(:course) {FactoryGirl.create(:course)}
  let(:assignment) {FactoryGirl.create(:assignment, course: course)}
  let(:student) {FactoryGirl.create(:student)}
  let(:enrolled_student) {FactoryGirl.create(:enrolled_student, student: student, course: course)}
  let!(:enrolled_student_assignment) {FactoryGirl.create(:enrolled_student_assignment, enrolled_student: enrolled_student, assignment: assignment)}

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', student_id: student.id, course_id: course.id
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', student_id: student.id
      response.should be_success
    end
  end

  describe "PUT 'submit_assignment'" do
    it "returns http success" do
      put 'submit_assignment', student_id: student.id, id: enrolled_student_assignment.id
      response.should be_success
    end
  end

end
