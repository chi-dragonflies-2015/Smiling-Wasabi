Rails.application.routes.draw do

  root 'films#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
