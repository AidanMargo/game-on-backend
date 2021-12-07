Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get "/games", to: "games#index"

  post "/games", to: "games#create"

  get "/games/:id", to: "games#show"

  post "/users", to: "users#create"




end
