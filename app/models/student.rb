# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Student < ActiveRecord::Base
	has_many :enrolled_students
	has_many :courses, through: :enrolled_students
end
