class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      session[:user_id] = @user
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end