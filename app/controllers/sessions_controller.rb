class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      flash[:success] = "You have successfully logged in."
    else
      flash.now[:danger] = "There was something wrong with your login information."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:success] = "You have successfully logged out."
  end
end

