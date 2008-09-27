require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  it "should return a success for the new action" do
    get("new").should be_success
  end
end
