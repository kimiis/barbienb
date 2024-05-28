Rails.application.routes.draw do

  devise_for :users
  root to: "houses#index"
  resources :houses, only: %i[new create show] do
    resources :bookings, only: %i[new create show]
  end
  resources :bookings, only: %i[index show]
end
