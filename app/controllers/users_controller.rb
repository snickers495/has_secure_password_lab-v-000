require 'pry'
class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.authenticate(params[:password])
      binding.pry
      @user.save
      session[:user_id] = @user.id
      
      redirect_to user_path
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
