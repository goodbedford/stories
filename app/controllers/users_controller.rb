class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to '/profile'
  end

  def edit
    @current_user = User.find(session[:user_id])
  end

  def update
    @current_user = User.find(session[:user_id])
    @current_user.update_attributes user_params
    redirect_to '/profile'
  end

  def show
    @current_user = User.find(session[:user_id])
  end

  def destroy
    @current_user = User.find(session[:user_id])
    User.delete(@current_user.id)
    redirect_to '/'
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
end
