Rails.application.routes.draw do
  resources :cards
  resources :users
  devise_for :users
  root 'home#index'
end
