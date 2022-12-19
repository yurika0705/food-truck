Rails.application.routes.draw do
  devise_for :users
  root to: 'locations#index'

  get 'events/index'
  get '/locations/prefecture/:id', to: "location#prefecture"
  
  resources :users
  resources :locations do
    resources :events
  end
end
