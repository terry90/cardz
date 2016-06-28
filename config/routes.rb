Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations',
                                    registrations: 'users/registrations' }

  devise_scope :user do
    patch '/confirm' => 'users/confirmations#confirm'
  end

  resources :locations do
    resources :offer_reductions
  end

  resources :businesses
  resources :cards
  resources :users
  root 'home#index'
end
