require 'digest'
 class User < ActiveRecord::Base
  attr_accessible :email, :password, :tel, :username, :enc_password
  attr_accessor :password

  before_save :encrypt_password
  has_many :ads
  has_many :favourites

  validates :email, :presence => true, :uniqueness => true, :length => {:within => 5..50},
              :format => {:with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i, :message => ' address is incorrect'}
  validates :password, :confirmation => true, :presence => true
  validates :username, :presence => true, :uniqueness => true

  def self.authenticate(username, password)
    user = find_by_username(username)
    return user if user && user.authenticated?(password)
  end
  def authenticated?(password)
    self.enc_password == encrypt(password + "huge_rounded" + salt + "grey_stones")
  end

  protected
   def encrypt_password
     return if password.blank?
     salt = generate_salt
     self.enc_password = encrypt(password + "huge_rounded" + salt + "grey_stones")
   end
   def encrypt(string)
     Digest::SHA1.hexdigest(string)
   end

  def  generate_salt
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    salt = ""
    1.upto(13) { |i| salt << chars[rand(chars.size-1)]}
    self.salt = salt
  end
end
