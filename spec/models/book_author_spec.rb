require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BookAuthor do
  before(:each) do
    @book_author = BookAuthor.new
  end

  it "should be valid" do
    @book_author.should be_valid
  end
end
