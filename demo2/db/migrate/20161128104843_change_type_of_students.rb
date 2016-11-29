class ChangeTypeOfStudents < ActiveRecord::Migration
  def change
  	change_column :students, :student_name, :string
  end
end
