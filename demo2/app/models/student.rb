class Student < ActiveRecord::Base
	#validates :student_name, presence: true
	validates :Age, presence: true
	validates :terms_of_service, acceptance: { accept: true }
	validates :email, presence: true, confirmation: true, uniqueness: true
	validates :email_confirmation, presence: true
	validates :pincode, length: { is: 6 , message: 'is of wrong length (should contain 6 numeric)' }
	
	before_create do
		self.student_name = student_name.capitalize unless student_name.blank?
	end

 	before_validation :ensure_name_has_a_value
 	protected
	def ensure_name_has_a_value
		if student_name.empty?
			self.student_name = email unless email.blank?
		end	
	end
	after_validation :change_student_name
	protected 
	def change_student_name
		if student_name.present?
			self.student_name = 'Vishal'
		end
	end
end