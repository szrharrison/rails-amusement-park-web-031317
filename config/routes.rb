Rails.application.routes.draw do
  resources :users
  resources :attractions
  # resources :sessions
  root to:'sessions#index'
  get '/signin' , to: 'sessions#new' , as: :login
  post '/sessions' , to: 'sessions#create', as: :create_session
  get '/logout', to: 'sessions#destroy' , as: :destroy_session
  post '/rides', to: 'rides#create', as: :create_ride
end
