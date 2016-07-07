Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations',
                                    registrations: 'users/registrations' }

  devise_scope :user do
    patch '/confirm' => 'users/confirmations#confirm'
  end

  resources :locations do
    resources :offer_reductions
  end

  resources :offer_reductions, only: [:index]
  resources :businesses
  resources :cards
  resources :users

  post '/user/preform', to: 'users#preform', as: :user_preform
  post '/user/check_cards', to: 'users#check_card', as: :user_check_card
  post '/user/check_credentials', to: 'users#check_credentials', as: :user_check_credentials

  authenticated :user do
    root to: 'locations#index', as: :authenticated_root
  end

  root 'home#index', as: :root
end
