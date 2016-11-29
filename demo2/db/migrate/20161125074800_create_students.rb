class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :Student_Name
      t.integer :Age
      t.timestamps null: false
    end
  end
end
