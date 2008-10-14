require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LoginsController do

  #Delete this example and add some real ones
  it "should use LoginsController" do
    controller.should be_an_instance_of(LoginsController)
  end

  describe "#login" do
    it "should set the user_id in the session when a user logs in successfully" do
      post "login", {:user => {:email_address => "jeremy@infinitecube.com", :password => "password"}}
      
      session[:userid].should == 1
      session[:username].should == "jgailor"
      response.should be_redirect
    end
    
    it "should set a message in the flash[:error] when a user fails to log in" do
      post "login", {:user => {:email_address => "notreal@notreal.com", :password => "password"}}
      
      session[:user_id].should == nil
      session[:username].should == nil
      flash[:error].should_not be_nil
      response.should be_redirect
    end
  end
end
