require 'spec_helper'

describe AssignmentsController do
  let!(:student) {FactoryGirl.create(:student)}
  let!(:course) {FactoryGirl.create(:course)}
  let!(:assignment) {FactoryGirl.create(:assignment, course_id: course.id)}

  describe "GET 'new'" do
    it "returns http success" do
      get 'new', student_id: student.id, course_id: course.id
      response.should be_success
    end

    it "should make a new assignment" do
      get 'new', student_id: student.id, course_id: course.id
      expect(assigns(:assignment)).to_not be_nil
    end
  end

  describe "POST 'create'" do
    it "should redirect" do
      post 'create', student_id: student.id, course_id: course.id, assignment:{"description" => "Hai", "max_points" => "100", "start_date" =>  Date.today, "due_date" => Date.today+1}
      response.should be_redirect
    end

    it "should create a new assignment" do
      expect{
        post 'create', student_id: student.id, course_id: course.id, assignment:{"description" => "Hai", "max_points" => "100", "start_date" =>  Date.today, "due_date" => Date.today+1}
        }.to change(Assignment, :count).by(+1)
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http success" do
      delete 'destroy', student_id: student.id, course_id: course.id, id: assignment.id
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', student_id: student.id, course_id: course.id, id: assignment.id
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', student_id: student.id, course_id: course.id
      response.should be_success
    end
  end

end
