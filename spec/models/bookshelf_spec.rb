require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Bookshelf do
  before(:each) do
    @bookshelf = Bookshelf.new
  end

  it "should contain books when the user adds them" do
    @bookshelf.should be_valid
  end
  
  it "should belong to a user" do
    
  end
  
  it "should contain books" do
    
  end
end
