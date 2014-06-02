require 'spec_helper'

describe CoursesController do
  let!(:course) {FactoryGirl.create(:course)}
  let!(:student) {FactoryGirl.create(:student)}

  describe "GET 'new'" do
    it "returns http success" do
      get 'new', student_id: student.id
      response.should be_success
    end

    it "should make a new class" do
      get 'new', student_id: student.id
      expect(assigns(:course)).to_not be_nil
    end
  end

  describe "GET 'create'" do
    it "should redirect for a successful creation" do
      post 'create', student_id: student.id, course:{"name" => "CS 405"}
      response.should be_redirect
    end

    it "should create a new course" do
      post 'create', student_id: student.id, course:{"name" => "CS 405"}
      Course.last.name.should match "CS 405"
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', student_id: student.id, :id => course.id
      response.should be_success
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http success" do
      delete 'destroy', student_id: student.id, :id => course.id
      response.should be_redirect
    end

    it "should destroy the target course" do
      delete 'destroy', student_id: student.id,  :id => course.id
      Course.where("id = ?", course.id)[0].should be_nil
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', student_id: student.id, :id => course.id
      response.should be_success
    end

    it "should retrieve the course from the database" do
      get 'show', student_id: student.id,  :id => course.id
      expect(assigns(:course).id).to be course.id
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', student_id: student.id
      response.should be_success
    end

    it "should retrieve all courses from the database" do
      get 'index', student_id: student.id 
      courseList = Course.all
      expect(assigns(:courses)).should =~ courseList
    end

    xit "should paginate returns" do
    end
  end

  describe "POST 'enroll'" do
    it "returns http success" do
      post 'enroll', student_id: student.id, :course_id => course.id
      response.should be_redirect
    end

    it "should create a new enrolled_student between the student and the course" do
      post 'enroll', student_id: student.id, :course_id => course.id
      expect(assigns(:new_enrolled_student)).should_not be_nil
    end

    it "should create the correct enrolled_student" do
      post 'enroll', student_id: student.id, :course_id => course.id
      expect(assigns(:new_enrolled_student).student.id).should be student.id
      expect(assigns(:new_enrolled_student).course.id).should be course.id
    end
  end

end
