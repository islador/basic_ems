require 'spec_helper'

describe StudentsController do
  let!(:student) {FactoryGirl.create(:student)}

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should redirect for a successful creation" do
      post 'create', student:{"name" => "John"}
      response.should be_redirect
    end

    it "should create a new student with the given name" do
      post 'create', student:{"name" => "John"}
      Student.last.name.should match "John"
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', :id => student.id
      response.should be_success
    end
  end

  describe "DELETE 'delete'" do
    it "should return http success" do
      delete 'destroy', :id => student.id
      response.should be_success
    end

    it "should destroy the target student" do
      delete 'destroy', :id => student.id
      Student.where("id = ?", student.id)[0].should be_nil
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => student.id
      response.should be_success
    end

    it "should retrieve the student from the database" do
      get 'show', :id => student.id
      expect(assigns(:student).id).to be student.id
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
