require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BookshelfController do
  describe "#show" do
    it "should return successful for the index action" do
      get :show, :user_id => users(:jeremy).id
      response.should be_success
    end
    
    it "should set the @books variable for the user" do
      get :show, :user_id => users(:jeremy).id
      assigns[:books].should include(books(:xpexplained))
    end
  end
end
