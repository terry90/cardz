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

  root 'home#index'
end
