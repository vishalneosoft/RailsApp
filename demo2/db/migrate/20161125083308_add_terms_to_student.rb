class AddTermsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :terms_of_service, :boolean
  end
end
