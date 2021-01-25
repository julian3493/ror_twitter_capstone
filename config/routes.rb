Rails.application.routes.draw do
  root 'opinions#index'

  resources :users do
    resources :followings
    member do
      post 'follow', to: 'followings#create'
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :opinions, only: [:index, :create]
end
