Rails.application.routes.draw do
  root to: "static_pages#home"

  get 'static_pages/home'
  get 'static_pages/about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :locations
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create]
end
