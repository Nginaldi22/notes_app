Rails.application.routes.draw do
  resources :notes
  get "sessions/controller"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "homepage/show/:id", to: "homepage#show", as: :homepage_show
  root "registration#sign_in"
  post "registration/login", to: "registration#login"
  get  "registration/new", to: "registration#new"
  post "registration", to: "registration#create"
  get "homepage", to: "homepage#show"
  delete "logout", to: "sessions#destroy"
  get "up" => "rails/health#show", as: :rails_health_check
end
