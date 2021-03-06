class UserController < ApplicationController

  def new
     @user = User.new
   end

   def create
     @user = User.new(user_params)
     if @user.save
       flash[:alert] = "The user has been saved."
       redirect_to root_path
     else
       render :new
     end

   end

   def user_params
     params.require(:user).permit(:email, :password, :password_confirmation)
   end


end
