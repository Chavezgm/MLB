Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/teams', to: 'teams#index'
  get '/teams/new', to: "teams#new"
  post '/teams', to: 'teams#create'
  get '/teams/:id', to: 'teams#show'
  get '/teams/:id/edit', to: 'teams#edit'
  patch '/teams/:id', to: 'teams#update'
  delete '/teams/:id', to: 'teams#destroy'

  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  get '/players/:id/edit', to: 'players#edit'
  patch '/players/:id', to: 'players#update'
  delete 'players/:id', to: 'players#destroy'

  get '/teams/:id/players', to: "team_players#index"
  get '/teams/:id/players/new', to: "team_players#new"
  post '/teams/:id/players', to: "team_players#create"
  delete '/teams/:team_id/players/:id', to: 'team_players#destroy'
end
