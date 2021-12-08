Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #GAMES
  get "/games", to: "games#index"

  post "/games", to: "games#create"

  get "/games/:id", to: "games#show"

  delete "/games/:id", to: "games#destroy"

  #USERS
  post "/users", to: "users#create"

  get "/users/games/:id", to: "users#games"

  get "users/hosted_games/:id", to: "users#hosted_games"

  #Participants
  post "/participants", to: "participants#create"

  delete "participants/:id", to: "participants#destroy"

  #session info
  get "/me", to: "users#show"

  post '/login', to: 'sessions#create'

  delete "logout", to "sessions#destory"




end
