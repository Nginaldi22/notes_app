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
    redirect_to homepage_show_path
  else
    render :new
  end
  end

  def login
  end

  private
def registration_parms
  params.require(:registration).permit(:name, :email, :password, :password_confirmation)
end
end
