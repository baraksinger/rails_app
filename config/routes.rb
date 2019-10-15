Rails.application.routes.draw do
  get '/users/:id', to: 'users#get'
  post '/users', to: 'users#create'
  post '/users/create_multi', to: 'users#create_multi'
  put '/users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
  # resources :users
end
