require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BooksController do
  describe "#create" do
    before :each do
      session[:userid] = users(:jeremy)
      @params = {:book => {:title => "Book A", :pages => 100, 
                           :publication_date => "10.10.2008", 
                           :isbn => "asb-dsad-123",
                           :author_name => "James Joyce"}}
    end
    
    it "should create a new book record" do
      post :create, @params
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
    
    it "should add the new book to the users bookshelf who created it" do
      post :create, @params
      u = User.find(users(:jeremy).id)
      b = Book.find_by_title("Book A")
      u.books.should include(b)
    end

    it "should create a new bookcover if one is uploaded" do
      bookcover = mock_model(BookCover)
      BookCover.should_receive(:new).with("somedata").and_return(bookcover)
      @params[:bookcover] = "somedata"
      post :create, @params
    end
    
    it "should not create a new bookcover if one is not uploaded" do
      bookcover = mock_model(BookCover)
      BookCover.should_not_receive(:new)
      
      post :create, @params   
    end
  end
  
  describe "#new" do
    it "should show the new book page" do
      get :new
      response.should be_success
    end
  end
end
