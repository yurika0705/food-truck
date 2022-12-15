Rails.application.routes.draw do
  devise_for :users
  root to: 'locations#index'
  
  get '/locations/prefecture/:id', to: "location#prefecture"
  resources :users, only: [:edit, :update]
  resources :locations
  
end
