FactoryGirl.define do
	factory :student do
		sequence(:name) {|n| "Student #{n}"}
	end

	factory :course do
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
end