class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: user_params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to users_path
  end
end
