class RenameColumnCategories < ActiveRecord::Migration
  def change
    rename_column :ads, :category, :category_id
    add_index :ads, :category_id
  end

end
