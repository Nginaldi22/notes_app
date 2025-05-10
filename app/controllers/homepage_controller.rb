class HomepageController < ApplicationController
  def show
    @registration = Registration.find(params[:id])
    @homepage = @registration.homepage
  end
end
