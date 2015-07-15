Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'genres#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  
  get '/films/:film_id/reviews' => 'reviews#index'
  get '/films/:film_id/reviews/new' => 'reviews#new'
  post '/films/:film_id/reviews' => 'reviews#create'
  get '/films/:film_id/reviews/:review_id' => 'reviews#show'
  get '/films/:film_id/reviews/:review_id/edit' => 'reviews#edit'
  put '/films/:film_id/reviews/:review_id' => 'reviews#update'
  delete '/films/:film_id/reviews/:review_id' => 'reviews#destroy'

  put '/films/:film_id/vote' => 'votes#vote'
  put '/reviews/:review_id/vote' => 'votes#vote'

end
