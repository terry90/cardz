Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }

  devise_scope :user do
    patch '/confirm' => 'confirmations#confirm'
  end

  resources :locations
  resources :businesses
  resources :cards
  resources :users
  root 'home#index'
end
