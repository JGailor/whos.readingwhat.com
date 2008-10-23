class Book < ActiveRecord::Base
  has_many :book_authors
  has_many :bookshelf_books
  has_many :bookshelves, :through => :bookshelf_books
  has_many :authors, :through => :book_authors
  has_many :users, :through => :bookshelves
  
  has_one :cover, :class_name => "BookCover"

  validates_presence_of :title, :message => "you must provide a title"
  validates_associated :authors, :message => "there must be an author"
  
  def self.build(attributes)
    authors = [Author.find_or_create_by_name(attributes[:author_name])]
    book = create({:title => attributes[:title], :pages => attributes[:pages],
                   :publication_date => attributes[:publication_date], :isbn => attributes[:isbn],
                   :authors => authors})
    if book.valid? && attributes[:bookcover]
      bookcover = BookCover.create(attributes[:bookcover])
      book.cover = bookcover if bookcover.valid?
    end
    
    book
  end
end
