Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'my_market', to: 'users#my_market'
end
