class DropTable < ActiveRecord::Migration
  def up
  	drop_table :favoutites
  end

  def down
  end
end
