Rails.application.routes.draw do

  root to: "home#index"
#  devise_for :users
  resources :users, :rides
  resources :attractions
  resources :sessions, only: [:create, :destroy]
  get  '/signin', to: 'users#signin'
  post '/signin', to: 'sessions#create'
  post '/rides/new', redirect_to: 'users#show'

end
