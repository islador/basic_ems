FactoryGirl.define do
	factory :student do
		sequence(:name) {|n| "Student #{n}"}
	end

	factory :course do
		sequence(:name) {|n| "Course #{n}"}
		start_date Date.today
		end_date Date.today+1
		sequence(:teacher_id) {|n| n}
		max_points 100
	end

	factory :assignment do
		start_date Date.today
		due_date Date.today+1
		max_points 100
		sequence(:description) {|n| "Description #{n}"}
		course
	end

	factory :enrolled_student do
		total_earned_points 0
		student
		course
	end

	factory :enrolled_student_assignment do
		earned_points 0
		submit_date Date.today+1
		enrolled_student
		assignment
	end
end