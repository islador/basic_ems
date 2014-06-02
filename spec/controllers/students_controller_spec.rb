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
    it "should redirect for a succesful creation" do
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
    it "returns http success" do
      delete 'destroy', :id => student.id
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => student.id
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end