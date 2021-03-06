require 'spec_helper'

describe EnrolledStudentAssignmentsController do
  let(:course) {FactoryGirl.create(:course)}
  let(:assignment) {FactoryGirl.create(:assignment, course: course)}
  let(:student) {FactoryGirl.create(:student)}
  let(:enrolled_student) {FactoryGirl.create(:enrolled_student, student: student, course: course)}
  let!(:enrolled_student_assignment) {FactoryGirl.create(:enrolled_student_assignment, enrolled_student: enrolled_student, assignment: assignment)}

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', student_id: student.id, id: enrolled_student_assignment.id
      response.should be_success
    end

    it "should retrieve the enrolled_student_assignment from the database" do
      get 'show', student_id: student.id, id: enrolled_student_assignment.id
      expect(assigns(:student_assignment)).to_not be_nil
      expect(assigns(:student_assignment)).to eq(enrolled_student_assignment)
    end

    it "should retrieve the course assignment from the database" do
      get 'show', student_id: student.id, id: enrolled_student_assignment.id
      expect(assigns(:course_assignment)).to_not be_nil
      expect(assigns(:course_assignment)).to eq(assignment)
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', student_id: student.id
      response.should be_success
    end

    it "should retrieve all of the student's course assignments" do
      courseAssignments = []
      student.enrolled_students.each do |es|
        courseAssignments.push(es.assignments)
      end
      courseAssignments.flatten!
      get 'index', student_id: student.id
      expect(assigns(:course_assignments)).to_not be_nil
      expect(assigns(:course_assignments)).to match_array(courseAssignments)
    end

    it "should retrieve all of the student's student assignments" do
      studentAssignments = []
      student.enrolled_students.each do |es|
        studentAssignments.push(es.enrolled_student_assignments)
      end
      studentAssignments.flatten!
      get 'index', student_id: student.id
      expect(assigns(:student_assignments)).to_not be_nil
      expect(assigns(:student_assignments)).to match_array(studentAssignments)
    end

    xit "should paginate the results" do
    end
  end

  describe "get 'submit_assignment'" do
    it "returns http success" do
      get 'submit_submission', student_id: student.id, id: enrolled_student_assignment.id
      response.should be_success
    end

    it "should retrieve the target enrolled_student_assignment from the database" do
      get 'submit_submission', student_id: student.id, id: enrolled_student_assignment.id
      expect(assigns(:enrolled_student_assignment)).to_not be_nil
      expect(assigns(:enrolled_student_assignment)).to eq(enrolled_student_assignment)
    end
  end

  describe "patch 'create_submission'" do
    #These tests poorly stub out the paperclip upload logic.
    it "redirects upon success" do
      patch 'create_submission', student_id: student.id, enrolled_student_assignment_id: enrolled_student_assignment.id, enrolled_student_assignment:{"submission"=>""}
      response.should be_redirect
    end

    it "should update the submit date" do
      patch 'create_submission', student_id: student.id, enrolled_student_assignment_id: enrolled_student_assignment.id, enrolled_student_assignment:{"submission"=>""}
      expect(assigns(:submission).submit_date).to_not be_nil
      expect(assigns(:submission).submit_date).to eq(Date.today)
    end
  end
end
