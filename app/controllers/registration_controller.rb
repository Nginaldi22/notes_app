class RegistrationController < ApplicationController
  def sign_in
  end

  def new
    @registration=Registration.new
  end

  def create
  end

  def login
  end

  private
def registration_parms
  params.require(:registration).permit(:name, :email, :password)
end
end
