Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "about#index"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password/reset", to: "password_reset#new"
  post "password/reset", to: "password_reset#create" 

  get "password/reset/edit", to: "password_reset#edit"
  patch "password/reset/edit", to: "password_reset#update"

  get "auth/twitter/callback", to: "omniauth_callbacks#twitter"

  delete "logout", to: "sessions#destroy"
  root to: "main#index"


  resources :twitter_accounts 
  resources :posts 

  # Defines the root path route ("/")
  # root "articles#index"
end
