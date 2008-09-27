require File.dirname(__FILE__) + "/../../spec_helper"

describe "/users/new" do
  it "should have a form to create a new user" do
    assigns[:user] = User.new
    render "/users/new"
    
    response.should have_tag('form') do
      with_tag('input[id=user_email_address&class=form_label]')
      with_tag('input[id=user_password]')
      with_tag('input[id=confirm]')
      with_tag('input[id=user_nickname]')
      with_tag('input[type=submit]')
    end
  end
end