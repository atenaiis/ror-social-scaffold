Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  get 'requests', to: 'users#requests'
  resources :friendships, only: [:update, :destroy]


  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  get '/adding/:friend_id', to: 'friendships#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
