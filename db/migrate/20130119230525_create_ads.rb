class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.text :content
      t.integer :category
      t.date :date_created
      t.string :status
      t.string :picture

      t.timestamps
    end
  end
end
