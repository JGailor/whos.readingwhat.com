class Application < Merb::Controller
  before :set_title
  
  def set_title
    @title = "whos.readingwhat.com"
  end
end