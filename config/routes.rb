Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'genres#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/reviews', to:'reviews#latest', as: :latest_reviews

  resources :films, :only => [:index, :show] do
    resources :reviews
  end

  get '/films/:film_id/comments/new' => 'comments#new'
  get '/films/:film_id/reviews/:review_id/comments/new' => 'comments#new'

  post '/films/:film_id/comments' => 'comments#create'
  post '/films/:film_id/reviews/:review_id/comments' => 'comments#create'

  put '/films/:film_id/comments/:id' => 'comments#update'
  put '/films/:film_id/reviews/:review_id/comments/:id' => 'comments#update'

  delete '/films/:film_id/comments/:id' => 'comments#destroy'
  delete '/films/:film_id/reviews/:review_id/comments/:id' => 'comments#destroy'

  put '/films/:film_id/vote' => 'votes#vote'
  put '/reviews/:review_id/vote' => 'votes#vote'

  post '/films/:film_id/vote' => 'votes#vote'
  post '/reviews/:review_id/vote' => 'votes#vote'


end
