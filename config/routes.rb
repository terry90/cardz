Rails.application.routes.draw do
  resources :locations
  resources :businesses
  resources :cards
  resources :users
  devise_for :users
  root 'home#index'
end
