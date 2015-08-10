class SessionsController < ApplicationController
  #login form
  def new

  end

  #authenticate the user
  def create  
    user = User.find_by_email(user_params[:email])

    if user.authenticate(user_params[:password])
        sessions[:user_id] = user.id 
        redirect_to user_path
    else
      puts "didn't authenticate"
      redirect_to new_user_path
    end

  end

  #logout user
  def destroy
    sessions[:user_id] = nil    
    redirect_to "/"
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
end
