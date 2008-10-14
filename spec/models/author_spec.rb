require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Author do
  before(:each) do
    @author = authors(:jamesjoyce)
  end

  it "should be valid" do
    @author.should be_valid
  end
  
  it "should have books" do
    @author.books.first.should == books(:finneganswake)
  end
end
