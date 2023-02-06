Rails.application.routes.draw do
  resources :foods
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end
  
  root to: 'travel_datasets#index'
  resources :travel_datasets
end