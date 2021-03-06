require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    resources :users, only: [:show] do
      resources :payments, only: [:new, :create]
    end

    resources :categories, only: [:index, :create, :show, :destroy]
    resources :products, only: [:new, :create, :edit, :update, :show, :index] do
      resources :bids, only: [:new, :create]
      resources :images, only: [:new, :create]
    end

    resource :search, only: [:show]
    get "/", to: "dashboards#show", as: :dashboard
  end

  root to: "sessions#new"
end
