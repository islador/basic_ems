require 'spec_helper'

describe CoursesController do
  let!(:course) {FactoryGirl.create(:course)}

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "should make a new class" do
      get 'new'
      expect(assigns(:course)).to_not be_nil
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      post 'create', course:{"name" => "CS 405"}
      response.should be_redirect
    end

    it "should create a new course" do
      post 'create', course:{"name" => "CS 405"}
      Course.last.name.should match "CS 405"
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', :id => course.id
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      delete 'destroy', :id => course.id
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => course.id
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST 'enroll'" do
    it "returns http success" do
      post 'enroll', :course_id => course.id
      response.should be_success
    end
  end

end
