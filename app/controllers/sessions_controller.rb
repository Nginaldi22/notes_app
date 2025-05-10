class SessionsController < ApplicationController
  def new
  end

  def create
    user = Registration.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Logged in"
    else
      flash[:alert] = "Invalid email or password"
      redirect_to login_path, notice: "Invalid"
    end
  end

  def destroy
     session[:user_id] = nil
     redirect_to root_path
  end
end
