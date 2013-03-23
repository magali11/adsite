# table "ads"
#  t.string   "title"
#  t.text     "content"
#  t.string   "status"
#  t.string   "image"
#  t.datetime "created_at",  :null => false
#  t.datetime "updated_at",  :null => false
#  t.integer  "user_id"
#  t.integer  "category_id"

class Ad < ActiveRecord::Base
  attr_accessible :content, :image, :image_cache, :remove_image, :status, :title, :category, :category_id

  validates :content, :title, :category_id, :presence => true
  validates :image, :format => {:with => %r{\.(gif|jpg|png)$}i, :message => 'Image must be in jpg, gif or png format'}, :allow_blank => true

  belongs_to :user
  belongs_to :category
  has_many :favourites

  mount_uploader :image, ImageUploader

  def self.view_descendants(categoryId)
    categories_set = Array.new
    Category.find(categoryId).self_and_descendants.each do |descendant|
      categories_set << descendant.id
    end
    return ads = where(:category_id => categories_set)
  end

  def self.search(searchQuery)
    if searchQuery 
       find(:all, :conditions => ["title LIKE ? or content LIKE ?", "%#{searchQuery}%", "%#{searchQuery}%"])
    end
  end

end