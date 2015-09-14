class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(username: params[:user][:username])
    @user.password = params[:user][:password]
    @user.save!
    redirect_to welcome_index_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  def forgot_password_get
    
  end

  def forgot_password
    @user = User.find_by_username(params[:username])
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    @user.password = random_password
    @user.save!
    Mailer.create_and_deliver_password_change(@user, random_password)
  end

end
