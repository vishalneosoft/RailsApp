class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :professor_name
      t.text :comments
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
