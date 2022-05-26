# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
# root "articles#index"

Rails.application.routes.draw do
  # GET "/about"
  get "/about-us", to: "about#index", as: :about

  # Root Route
  root "main#index"
end