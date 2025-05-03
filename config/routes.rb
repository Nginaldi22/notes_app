Rails.application.routes.draw do
  root "registration#new"
  get "registration/signup"
  get "up" => "rails/health#show", as: :rails_health_check

end
