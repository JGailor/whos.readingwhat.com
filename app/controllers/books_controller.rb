class BooksController < ApplicationController
  def create
    book = Book.build(params[:book])
    if book.valid?
      redirect_to user_bookshelf_path(session[:userid])
    else
      flash[:error] = "There was a problem creating the book"
    end
  end
end
