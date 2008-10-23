require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BookshelfBook do
  before(:each) do
    @bookshelf_book = BookshelfBook.new
  end

  it "should be valid" do
    @bookshelf_book.should be_valid
  end
end
