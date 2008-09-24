class User
  include DataMapper::Resource

  property :id,             Integer,  :serial => true
  property :email,          String,   :nullable => false
  property :password,       String,   :nullable => false
  property :created_at,     DateTime, :nullable => false
  property :last_logged_in, DateTime, :nullable => false
end
