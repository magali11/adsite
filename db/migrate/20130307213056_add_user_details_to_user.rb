class AddUserDetailsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :fname, :string
  	add_column :users, :lname, :string
  	add_column :users, :county, :string
  	add_column :users, :town, :string
  end
end
