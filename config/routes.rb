Rails.application.routes.draw do
  devise_for :users
  resources :locations
  resources :businesses
  resources :cards
  resources :users
  root 'home#index'
end
