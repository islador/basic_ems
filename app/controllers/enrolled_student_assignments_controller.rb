class EnrolledStudentAssignmentsController < ApplicationController

	def show
		@student_assignment = EnrolledStudentAssignment.where("id = ?", params[:id])[0]
		@course_assignment = @student_assignment.assignment
	end

	def index
		#This is terrible; pretty sure it's N+1, there should be a way to offload this to the DB, but I'm too tired to find it.
		student = Student.where("id = ?", params[:student_id])[0]
		@student_assignments = []
		student.enrolled_students.each do |es|
			@student_assignments.push(es.enrolled_student_assignments)
		end
		@student_assignments.flatten!

		@course_assignments = []
		student.enrolled_students.each do |es|
			@course_assignments.push(es.assignments)
		end
		@course_assignments.flatten!
		
		#@course_assignments = Student.where("id = ?", params[:student_id])[0].enrolled_students.joins(:assignments)
	end

	def submit_submission
		@enrolled_student_assignment = EnrolledStudentAssignment.where("id = ?", params[:id])[0]
	end

	def create_submission
		@submission = EnrolledStudentAssignment.where("id = ?", params[:enrolled_student_assignment_id])[0]
		@submission.submit_date = Date.today
		@submission.update_attributes(params[:enrolled_student_assignment].permit(:submission))
		redirect_to student_enrolled_student_assignments_path(student_id: params[:student_id])
	end
end
