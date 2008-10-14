class LoginsController < ApplicationController
  def login
    if user = User.login(params[:user])
      session[:userid] = user.id
      session[:username] = user.nickname || user.email_address
    else
      flash[:error] = "Invalid credentials"
    end
      redirect_to root_url    
  end
  
  def logout
    session[:userid] = nil
    session[:username] = nil
  end
end
