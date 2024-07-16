class UsersController < ApplicationController
  def show
    # @user = User.find(params[:user])
  end

  def new
    @user = User.new
  end

  def create
    user = user_params
    new_user = User.new(user)
    if new_user.save #&& user_params[:password] == user_params[:confirmation_password]
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.username}!"
      redirect_to root_path
    else 
      flash[:error] = "Sorry, username or password is incorrect"
      redirect_to new_user_path
    end
  end

  def login_form
  end

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      redirect_to user_path(user)
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to root_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password, :confirmation_password)
  end
end