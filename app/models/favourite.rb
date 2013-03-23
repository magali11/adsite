class Favourite < ActiveRecord::Base
  attr_accessible :ad_id, :user_id
  belongs_to :user
  belongs_to :ad


end
