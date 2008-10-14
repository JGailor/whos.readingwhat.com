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
end
