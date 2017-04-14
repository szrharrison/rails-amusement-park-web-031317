Rails.application.routes.draw do
  resources :users
  resources :rides
  resources :attractions
  # resources :sessions
  root to:'sessions#index'
  get '/login' , to: 'sessions#new' , as: :login
  post '/sessions' , to: 'sessions#create', as: :create_session
  delete '/logout', to: 'sessions#destroy' , as: :destroy_session
end
