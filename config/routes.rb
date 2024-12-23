Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "items#index"

  resources :items, except: :index do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: :destroy

  resources :bookings, only: [:new, :create, :destroy, :index, :show]

  get "my-items", to: "pages#my_items", as: :my_items
  get "user-items", to: "pages#user_items", as: :user_items
  get "my-account", to: "pages#my_account", as: :my_account
end
