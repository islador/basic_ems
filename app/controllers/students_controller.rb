class StudentsController < ApplicationController
    def new
        @student = Student.new
    end

    def create
        @new_student = Student.new(params[:student].permit(:name))
        if @new_student.valid? == true
            @new_student.save!
            redirect_to @new_student
        else
            render 'new'
        end
    end

    def edit
    end

    def destroy
        render nothing: true
    end

    def show
        @student = Student.where("id = ?", params[:id])[0]
    end

    def index
    end
end
