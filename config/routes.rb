Rails.application.routes.draw do
  root "other_pages#dashboard"

  resources :persons
  resources :memberships
  resources :sso_users
  resources :keysets
  resources :notes

  get  "/login",  to: "sessions#login"
  post "/login",  to: "sessions#create"
  get  "/logout", to: "sessions#destroy"
  post "/logout", to: "sessions#destroy"
end
