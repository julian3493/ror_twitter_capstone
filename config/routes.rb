Rails.application.routes.draw do
  root 'opinions#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :opinions, only: [:index, :create]
  resources :followings
end
