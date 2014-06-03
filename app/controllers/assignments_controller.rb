class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
    @course = Course.where("id = ?", params[:course_id])[0]
  end

  def create
    @new_assignment = Assignment.new(params[:assignment].permit(:name, :description, :start_date, :due_date, :max_points))
    if @new_assignment.valid? == true
      @new_assignment.save!
      redirect_to student_course_assignment_path(params[:student_id], params[:course_id], @new_assignment)
    else
      render 'new'
    end
  end

  def destroy
  end

  def show
    @assignment = Assignment.where("id = ?", params[:id])[0]
  end

  def index
  end
end
