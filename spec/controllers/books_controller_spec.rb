require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BooksController do
  describe "#create" do
    it "should create a new book record" do
      post :create, {:book => {:title => "Book A", :pages => 100, 
                               :publication_date => "10.10.2008", 
                               :isbn => "asb-dsad-123",
                               :author_name => "James Joyce"}}
      response.should be_redirect
      b = Book.find(:last)
      b.title.should == "Book A"
      b.authors.should include(authors(:jamesjoyce))
    end
    
    it "should populate the flash with errors when no title is provided" do
      post :create, {:book => {:pages => 100}}
      flash[:error].should_not be_nil
    end
    
    it "should populate the flash with errors when no author name is provided" do
      post :create, {:book => {:title => "The Wind in the Willows"}}
      flash[:error].should_not be_nil
    end
  end
end
