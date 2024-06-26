Rails.application.routes.draw do
  devise_for :users
  root to: "houses#index"
  get '/houses/search', to: 'houses#search', as: 'search_houses'
  resources :houses, only: %i[new create show destroy edit update] do
    resources :bookings, only: %i[new create show]
  end
  resources :dashboards, only: [:index], path: 'dashboard'
  resources :bookings, only: %i[index show]
 
end
