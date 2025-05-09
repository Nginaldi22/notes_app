Rails.application.routes.draw do
  root "registration#sign_in"
  post "registration/login", to: "registration#login"
  get  "registration/new", to: "registration#new"
  post "registration", to: "registration#create"
  get "up" => "rails/health#show", as: :rails_health_check
end
