class Book < ActiveRecord::Base
  has_many :book_authors
  has_many :bookshelves
  has_many :authors, :through => :book_authors
  has_many :users, :through => :bookshelves

  validates_presence_of :title
  validates_associated :authors
  
  def self.build(attributes)
    authors = [Author.find_or_create_by_name(attributes[:author_name])]
    book = create({:title => attributes[:title], :pages => attributes[:pages],
                :publication_date => attributes[:publication_date], :isbn => attributes[:isbn],
                :authors => authors})
  end
end
