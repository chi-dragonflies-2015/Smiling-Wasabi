Rails.application.routes.draw do

  root 'users#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
