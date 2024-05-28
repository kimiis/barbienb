Rails.application.routes.draw do
  devise_for :users
  root to: "houses#index"
  resources :houses, only: %i[new create show destroy] do
    resources :bookings, only: %i[new create show]
  end
  resources :dashboards, only: [:index], path: 'dashboard'
  resources :bookings, only: %i[index show]
end
