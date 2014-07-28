require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :products, only: [:new]

  constraints Monban::Constraints::SignedIn.new do
    get "/", to: "dashboard#show", as: :dashboard
  end

  root to: "sessions#new"
end
