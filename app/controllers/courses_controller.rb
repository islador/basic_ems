class CoursesController < ApplicationController
    def new
        @course = Course.new
    end

    def create
        @new_course = Course.new(params[:course].permit(:name))
        if @new_course.valid? == true
            @new_course.save!
            redirect_to @new_course
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
            render 'index'
        end
    end

    def show
    end

    def index
    end

    def enroll
    end
end
