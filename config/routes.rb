Rails.application.routes.draw do
  devise_for :users
  root to: "offices#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :offices do
    resources :bookings, only: [ :create, :update]
    resources :reviews, only: [:create]
  end
  resources :bookings, only: [ :destroy, :index ]
  resources :reviews, only: :destroy
  # Defines the root path route ("/")
  # root "articles#index"
end
