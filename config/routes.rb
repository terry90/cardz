Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations',
                                    registrations: 'users/registrations' }

  devise_scope :user do
    patch '/confirm' => 'users/confirmations#confirm'
  end

  resources :locations do
    resources :offer_reductions # TODO abstract offer_reductions to offers
  end

  resources :businesses
  resources :cards
  resources :users

  post '/user/preform', to: 'users#preform', as: :user_preform

  root 'home#index'
end
