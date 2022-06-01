# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
# root "articles#index"

Rails.application.routes.draw do
  # GET "/about"
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

  # Route for session log out
  delete "/logout", to: "session#destroy"

  # Root Route
  root "main#index"
end