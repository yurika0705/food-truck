Rails.application.routes.draw do
  get 'calenders/index'
  devise_for :users
  root to: 'locations#index'
  
  get '/locations/prefecture/:id', to: "location#prefecture"
  resources :users
  resources :locations do
    resources :calenders
  end
end
