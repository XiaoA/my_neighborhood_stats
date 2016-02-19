Rails.application.routes.draw do
  root to: "static_pages#home"

  get 'static_pages/home'
  get 'static_pages/about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  resources :locations, only: [:index, :new, :create, :show]
  resource :session, only: [:new, :create]
  resources :users, only: [:show, :new, :create]
end
