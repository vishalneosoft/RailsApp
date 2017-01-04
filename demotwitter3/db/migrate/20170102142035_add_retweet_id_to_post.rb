class AddRetweetIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :retweet_id, :integer
  end
end
