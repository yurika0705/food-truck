Rails.application.routes.draw do
  devise_for :users
  root to: 'locations#index'

  resources :users, only: [:edit, :update]
  resources :locations
end
