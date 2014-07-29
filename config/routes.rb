require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    resources :categories, only: [:index, :create]
    resources :products, only: [:new, :create, :show]
    
    resources :users, only: [:show] do
      resources :products, only: [:index]
    end

    get "/", to: "dashboards#show", as: :dashboard
  end

  root to: "sessions#new"
end
