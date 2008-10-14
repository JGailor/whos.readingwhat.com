require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Book do
  before(:each) do
    @book = books(:finneganswake)
  end

  it "should be valid" do
    @book.should be_valid
  end
  
  it "should belong to an author" do
    @book.authors.first.should == authors(:jamesjoyce)
  end
  
  it "can be a part of someones bookshelf" do
    book = books(:xpexplained)
    book.users.should include(users(:jeremy))
  end
  
  describe "#build" do
    it "should create a new book" do
      Book.build({:title => "Book A", :pages => 100, 
                  :publication_date => "10/10/2008", 
                  :isbn => "abc-123", :author_name => "James Joyce"})
      b = Book.find(:last)
      b.title.should == "Book A"
      b.authors.should include(authors(:jamesjoyce))
    end
    
    it "should throw an error when a book is created without an author" do
      Book.build({:title => "Book A", :pages => 100, :publication_date => "10/10/2008"}).should have_at_least(1).error_on(:authors)
    end
    
    it "should throw an error when a book is created without a title" do
      Book.build({:pages => 100}).should have(1).error_on(:title)
    end
  end
end
