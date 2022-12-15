Rails.application.routes.draw do
  get 'calenders/index'
  devise_for :users
  root to: 'locations#index'
  
  get '/locations/prefecture/:id', to: "location#prefecture"
  resources :users, only: [:edit, :update]
  resources :locations
  resources :calenders
end
