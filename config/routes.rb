require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    resources :users, only: [:show]
    resources :categories, only: [:index, :create, :show, :destroy]
    resources :products, only: [:new, :create, :show, :index] do
      resources :images, only: [:new, :create]
    end

    get "search" => "searches#show"
    get "/", to: "dashboards#show", as: :dashboard
  end

  root to: "sessions#new"
end
