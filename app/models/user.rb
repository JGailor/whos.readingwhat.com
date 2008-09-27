require 'bcrypt'

class User < ActiveRecord::Base
  validates_uniqueness_of :email_address
  
  def before_save
    self.password = BCrypt::Password.create( self.password )
  end
  
  def self.login( options )
    user = find_by_email( options[:email] )
    
    if user && ( BCrypt::Password.new( user.password ) == options[:password] )
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
