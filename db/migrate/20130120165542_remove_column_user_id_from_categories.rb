class RemoveColumnUserIdFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :user_id
    add_column :categories, :created_by, :string
  end

  def down
    add_column :categories, :user_id, :integer
    remove_column :categories, :created_by
  end
end
