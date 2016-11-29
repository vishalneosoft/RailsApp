class Student < ActiveRecord::Base
	has_many :comments
	validates :first_name, presence: { message: 'required' }
	validates :last_name,presence: true
	validates_numericality_of :grade
end
