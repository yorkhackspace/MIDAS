Rails.application.routes.draw do
  root "persons#members"

  resources :persons
  resources :sso_users
  resources :notes

  get  "/login",  to: "sessions#login"
  post "/login",  to: "sessions#create"
  get  "/logout", to: "sessions#destroy"
  post "/logout", to: "sessions#destroy"
end
