class RenameColumnPictureImage < ActiveRecord::Migration
  def up
  	rename_column :ads, :picture, :image
  end

  def down
  	rename_column :ads, :image, :picture
  end
end

