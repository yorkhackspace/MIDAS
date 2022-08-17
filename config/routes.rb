Rails.application.routes.draw do
  root "other_pages#dashboard"

  resources :persons
  resources :memberships
  resources :sso_users
  resources :sso_user_authorisations
  resources :keysets
  resources :notes

  resources :wizards
  resources :wizard_completions
  resources :wizard_elements

  post "/review_all_completions/:id", to: "wizards#review_all_completions"

  get "/admin", to: "other_pages#admin"

  get  "/login",  to: "sessions#login"
  post "/login",  to: "sessions#create"
  get  "/logout", to: "sessions#destroy"
  post "/logout", to: "sessions#destroy"
end
