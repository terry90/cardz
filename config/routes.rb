Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations',
                                    registrations: 'users/registrations' }

  devise_scope :user do
    patch '/confirm' => 'confirmations#confirm'
  end

  resources :locations
  resources :businesses
  resources :cards
  resources :users
  resources :offer_reductions
  root 'home#index'
end
