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
end