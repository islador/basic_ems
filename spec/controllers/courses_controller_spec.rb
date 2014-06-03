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
    let!(:enrolled_student) {FactoryGirl.create(:enrolled_student, course_id: course.id, student_id: student.id)}
    it "returns http success" do
      get 'show', student_id: student.id, :id => course.id
      response.should be_success
    end

    it "should retrieve the course from the database" do
      get 'show', student_id: student.id,  :id => course.id
      expect(assigns(:course).id).to be course.id
    end

    it "should retrieve the enrolledStudent record from the database" do
      get 'show', student_id: student.id, :id => course.id
      expect(assigns(:enrolled_student)).to_not be_nil
      expect(assigns(:enrolled_student)).to eq(enrolled_student)
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
      expect(assigns(:courses)).to match_array(courseList)
    end

    xit "should paginate returns" do
    end

    it "should retrieve the enrolledStudent record from the database" do
      enrolledStudentList = EnrolledStudent.where("student_id = ?", student.id)
      get 'index', student_id: student.id, :id => course.id
      expect(assigns(:enrolled_students)).to_not be_nil
      expect(assigns(:enrolled_students)).to match_array(enrolledStudentList)
    end
  end

  describe "POST 'enroll'" do
    it "returns http success" do
      post 'enroll', student_id: student.id, :course_id => course.id
      response.should be_redirect
    end

    it "should create a new enrolled_student between the student and the course" do
      post 'enroll', student_id: student.id, :course_id => course.id
      expect(assigns(:new_enrolled_student)).to_not be_nil
    end

    it "should create the correct enrolled_student" do
      post 'enroll', student_id: student.id, :course_id => course.id
      expect(assigns(:new_enrolled_student).student.id).to be student.id
      expect(assigns(:new_enrolled_student).course.id).to be course.id
    end
  end
end
