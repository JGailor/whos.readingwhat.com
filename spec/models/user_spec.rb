require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  it "should have books if they have a bookshelf" do
    user = users(:jeremy)
    user.books.should include(books(:xpexplained))
  end
  
  describe "#login" do
    it "should return a user when authenticating with proper credentials" do
      User.login({:email_address => "jeremy@infinitecube.com", :password => "password"}).should == users(:jeremy)
    end
    
    it "should return nil when authenticating without proper credentials" do
      User.login({:email_address => "notreal@notreal.com", :password => "password"}).should be_nil
    end
  end
  
  describe "#create" do
    it "should create a user when given an email, password, and password confirmation" do
      User.create({:email_address => "test@test.com", :password => "password", :password_confirmation => "password"}).should be_valid
    end
    
    it "should not be valid and have the appropriate message when the password confirmation does not match the password" do
      u = User.create({:email_address => "test@test.com", :password => "password", :password_confirmation => "not_the_password"})
      u.should_not be_valid
      u.errors[:password].should == "password confirmation does not match the password"
    end
    
    it "should not be valid and have the appropriate message when no email_address is given" do
      u = User.create({:password => "password", :password_confirmation => "password"})
      u.should_not be_valid
      u.errors[:email_address].should == "you must specify an email address"
    end
    
    it "should not be valid and have the appropriate message when no password is given" do
      u = User.create({:email_address => "test@test.com"})
      u.should_not be_valid
      u.errors[:password].should == "you must give a password"
    end
    
    it "should validate that an email address is unique and give an appropriate message when it is not" do
      u = User.create({:email_address => "jeremy@infinitecube.com", :password => "password", :password_confirmation => "password"})
      u.should_not be_valid
      u.errors[:email_address].should == "that email address is already used"
    end
  end
end
