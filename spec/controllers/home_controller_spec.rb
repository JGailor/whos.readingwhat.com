require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do
  it "should return a successful response from index" do
    get 'index'
    response.should be_success
  end
end
