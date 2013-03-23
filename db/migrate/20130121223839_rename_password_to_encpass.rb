class RenamePasswordToEncpass < ActiveRecord::Migration
  def up
    rename_column :users, :password, :enc_password
  end

  def down
    rename_column :users, :enc_password, :password
  end
end
