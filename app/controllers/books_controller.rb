class BooksController < ApplicationController
  def new
  end
  
  def create
    book = Book.build(params)
    if book.valid? 
      cover = BookCover.new(params[:bookcover]) if params[:bookcover]
      book.cover = cover if cover && cover.valid?
      u = User.find(session[:userid])
      u.books << book
      redirect_to user_bookshelf_path(session[:userid])
    else
      flash[:error] = "There was a problem creating the book"
    end
  end
end
