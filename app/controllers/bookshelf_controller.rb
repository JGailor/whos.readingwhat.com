class BookshelfController < ApplicationController
  def show
    user = User.find(params[:user_id])
    @books = user.books
  end
end
