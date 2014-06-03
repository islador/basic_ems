class EnrolledStudentAssignmentsController < ApplicationController

	def show
		@student_assignment = EnrolledStudentAssignment.where("id = ?", params[:id])[0]
		@course_assignment = @student_assignment.assignment
	end

	def index
	end

	def submit_assignment
	end
end
