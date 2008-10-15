require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  describe "#new" do
    it "should return a success for the new action" do
      get("new").should be_success
    end
  end
  
  describe "#create" do
    before :each do
      @post_attributes = {:user => {:email_address => "test@testuser.com", :password => "password", :password_confirmation => "password"}}
    end
    
    it "should create add the new user id to the session when create is a success" do
      post :create, @post_attributes
      session[:userid].should_not be_nil
    end
    
    it "should redirect to the users bookshelf page after a user is created" do
      post :create, @post_attributes
      response.should redirect_to(user_bookshelf_path(session[:userid]))
    end
    
    it "should populate the flash[:error] when the password is not confirmed" do
      @post_attributes[:user][:password_confirmation] = ""
      post :create, @post_attributes
      flash[:errors][:password].should_not be_nil
    end
    
    it "should populate the flash[:error] when there is no email address" do
      @post_attributes[:user].delete(:email_address)
      post :create, @post_attributes
      flash[:errors][:email_address].should_not be_nil
    end
  end
end
