# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  start_date :date
#  end_date   :date
#  teacher_id :integer
#  max_points :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Course do
	let!(:course) {FactoryGirl.create(:course)}

	subject{course}

	it {should respond_to(:start_date)}
	it {should respond_to(:end_date)}
	it {should respond_to(:teacher_id)}
	it {should respond_to(:max_points)}

	it {should be_valid}

end
