class CoursesController < ApplicationController
    def new
        @course = Course.new
    end

    def create
        @new_course = Course.new(params[:course].permit(:name))
        if @new_course.valid? == true
            @new_course.save!
            redirect_to student_course_path(params[:student_id],@new_course)
        else
            render 'new'
        end
    end

    def edit
    end

    def destroy
        target = Course.where("id = ?", params[:id])[0]
        if target.nil? == false
            target.destroy!
            redirect_to student_courses_path(params[:student_id])
        end
    end

    def show
        @course = Course.where("id = ?", params[:id])[0]
    end

    def index
        @courses = Course.all
    end

    def enroll
        @new_enrolled_student = EnrolledStudent.new(student_id: params[:student_id], course_id: params[:course_id])
        if @new_enrolled_student.valid? == true
            @new_enrolled_student.save!
            redirect_to student_courses_path(params[:student_id], params[:course_id])
        end
    end
end
