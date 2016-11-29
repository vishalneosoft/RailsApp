class AddStudentNameFromStudents < ActiveRecord::Migration
  def change
    add_column :students, :student_name, :string
  end
end
