Rails.application.routes.draw do
  root   'static_pages#home'
  
  resources :users, :except => [:edit, :update, :destroy]
  get    '/signup',  to: 'users#new'
  get    '/index',   to: 'users#index'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
