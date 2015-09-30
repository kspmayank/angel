class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:user][:password]
    @user.role = "patient"
    @user.save!
    redirect_to welcome_index_path
  end

  def new_doctor
    
  end

  def create_doctor
    @user = User.new(name: params[:user][:name], username: params[:user][:username], dob: params[:user][:dob], description: params[:user][:description], city: params[:user][:city], hospital: params[:user][:hospital], speciality: params[:user][:speciality])
    @user.password = params[:user][:password]
    @user.role = "doctor"
    # p params["user"]["photoid"]
    uploaded_file = params[:user][:photoid]
    file_content = uploaded_file.read
    @user.photoid = Base64.encode64(file_content)

    certificate = params[:user][:certificate]
    file_certificate = certificate.read
    @user.certificate = Base64.encode64(file_certificate)

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

  private
  def user_params
    params.require(:user).permit!.except(:role)
  end

end
