class ChangeTypeOfStudents < ActiveRecord::Migration
  def change
  	change_column :students, :grade, :integer
  end
end
