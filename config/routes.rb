Rails.application.routes.draw do
  get '/users/:id', to: 'users#get'
  post '/users', to: 'users#create'
  put '/users/:id', to: 'users#update'
  # resources :users
end
