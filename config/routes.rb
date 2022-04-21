=begin 
Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Defines the root path route ("/")
root "articles#index"
=end

Rails.application.routes.draw do
  # Route for about-us
  get "/about-us", to: "about#index", as: :about

  # Route for registration
  get "/sign-up", to: "registration#new"
  post "/sign-up", to: "registration#create"

  # Route for log-in
  get "/log-in", to: "session#new"
  post "/log-in", to: "session#create"

  # Route to edit password
  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update"

  # Route to reset password
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  # Route for session log out
  delete "/logout", to: "session#destroy"

  # Route for Twitter API callback
  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  # To create the CRUD Routes
  resources :twitter_accounts

  #Added something
  #Added something else

  # Root Route
  root "main#index"
end