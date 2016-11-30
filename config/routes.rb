Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, :except => [:edit, :update, :destroy]
  get 'signup', to: 'users#new'
end
