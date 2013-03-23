class AddUserIdToAds < ActiveRecord::Migration
  def change
    add_column :ads, :user_id, :integer
    add_index :ads, :user_id
  end
end
