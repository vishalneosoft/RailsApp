class AddPincodeToStudent < ActiveRecord::Migration
  def change
    add_column :students, :pincode, :integer
  end
end
