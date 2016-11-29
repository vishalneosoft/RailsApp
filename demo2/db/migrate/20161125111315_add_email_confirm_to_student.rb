class AddEmailConfirmToStudent < ActiveRecord::Migration
  def change
    add_column :students, :email_confirmation, :string
  end
end
