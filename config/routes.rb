Rails.application.routes.draw do
  root 'opinions#index'

  resources :users do
    resources :followings, only: [:index, :create, :destroy]
    member do
      post 'follow', to: 'followings#create'
      delete 'unfollow', to: 'followings#destroy'
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :opinions, only: [:index, :create]
end
