Rails.application.routes.draw do

  root 'genres#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :films, :only => [:index, :show] do
    resources :reviews do
      resources :comments
    end
  end
  
  # get '/films/:film_id/reviews' => 'reviews#index'
  # get '/films/:film_id/reviews/new' => 'reviews#new'
  # post '/films/:film_id/reviews' => 'reviews#create'
  # get '/films/:film_id/reviews/:review_id' => 'reviews#show'
  # get '/films/:film_id/reviews/:review_id/edit' => 'reviews#edit'
  # put '/films/:film_id/reviews/:review_id' => 'reviews#update'
  # delete '/films/:film_id/reviews/:review_id' => 'reviews#destroy'

end
