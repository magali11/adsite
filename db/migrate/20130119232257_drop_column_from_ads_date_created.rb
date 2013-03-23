class DropColumnFromAdsDateCreated < ActiveRecord::Migration
  def up
    remove_column :ads, :date_created
    remove_column :ads, :date_updated
  end

  def down
    add_column :ads, :date_created, :date
    add_column :ads, :date_updated, :date
  end
end
