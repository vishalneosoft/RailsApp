class RemoveColumnFromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :address_type 
  end
end
