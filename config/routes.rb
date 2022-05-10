Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  root 'welcome#index'
  get 'my_market', to: 'users#my_market'
  get 'find_stock', to: 'stocks#find'
  get 'friends', to: 'users#friends'
  get 'find_friend', to: 'users#find'
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show]
end
