class SessionsController < ApplicationController
  def create 
    @user = User.find_by(name: params[:name])

end
