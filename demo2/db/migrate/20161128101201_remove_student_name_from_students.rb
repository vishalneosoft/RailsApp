class RemoveStudentNameFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :Student_Name, :string
  end
end
