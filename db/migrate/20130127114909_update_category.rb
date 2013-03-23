class UpdateCategory < ActiveRecord::Migration
  def up
    rename_column :categories, :parent_category, :parent_id
    add_column :categories, :lft, :integer
    add_column :categories, :rgt, :integer
  end

  def down
    remove_column :categories, :lft
    remove_column :categories, :rgt
  end
end
