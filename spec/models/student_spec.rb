# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Student do
	let(:student) {FactoryGirl.create(:student)}

	subject{student}

	it{should respond_to(:name)}
	it{should be_valid}
end
