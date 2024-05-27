Rails.application.routes.draw do
  get 'bookings/show'
  get 'bookings/index'
  get 'bookings/create'
  devise_for :users
  root to: "houses#index"
  resources :houses, only: %i[new create show] do
    resources :bookings, only: %i[new create show]
  end
end
