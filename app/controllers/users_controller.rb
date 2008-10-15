class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.create(params[:user])
    if user.valid?
      session[:userid] = user.id
      redirect_to user_bookshelf_path(user)
    else
      flash[:errors] = user.errors
    end
  end
end
