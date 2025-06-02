class RegistrationController < ApplicationController
  def sign_in
  end

  def new
    @registration=Registration.new
  end

  def create
     @registration = Registration.new(registration_parms)
  if @registration.save
    @registration.create_homepage(title: "Welcome #{@registration.name}!", description: "Your personal dashboard.")
    session[:user_id] = @registration.id
    redirect_to homepage_show_path(@registration.id)
  else
    render :new
  end
  end

  def login
    user = Registration.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to homepage_show_path(user.id), notice: "Logged in"
    else
      flash[:alert] = "Invalid email or password"
      redirect_to root_path, notice: "Invalid"
    end
  end
  def check_email
  email = params[:email].to_s.downcase
  exists = Registration.exists?(email: email)
  render json: { exists: exists }
  end

  private
def registration_parms
  params.require(:registration).permit(:name, :email, :password, :password_confirmation)
end
end
