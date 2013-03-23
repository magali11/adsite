# table "categories"
#  t.string   "name"
#  t.integer  "parent_id"
#  t.datetime "created_at", :null => false
#  t.datetime "updated_at", :null => false
#  t.string   "created_by"
#  t.integer  "lft"
#  t.integer  "rgt"

class Category < ActiveRecord::Base
  attr_accessible :name, :parent_id, :created_by
  has_many :ads
  acts_as_nested_set
end
