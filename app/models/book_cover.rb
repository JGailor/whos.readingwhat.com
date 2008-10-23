class BookCover < ActiveRecord::Base
  belongs_to :book
  
  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :max_size => 500.kilobytes,
                 :resize_to => '384x256',
                 :thumbnails => {:thumb => "100x100"}

  validates_as_attachment
end
