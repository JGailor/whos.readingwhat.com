require 'bcrypt'

class User < ActiveRecord::Base
  has_many :bookshelves
  has_many :books, :through => :bookshelves
  
  validates_presence_of :email_address, :message => "you must specify an email address"
  validates_presence_of :password, :message => "you must give a password"
  validates_uniqueness_of :email_address, :message => "that email address is already used"
  validates_confirmation_of :password, :message => "password confirmation does not match the password"
  
  def before_save
    self.password = BCrypt::Password.create( self.password )
  end
  
  def self.login( options )
    user = find_by_email_address( options[:email_address] )
    
    if user && (BCrypt::Password.new(user.password) == options[:password])
      return user
    end
  end
  
  def display_name
    self.nickname || self.email
  end
  
  def admin?
    self.admin
  end
end
