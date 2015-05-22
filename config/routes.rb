Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  resources :tweets
  resources :users, only: [:show, :index]

  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
