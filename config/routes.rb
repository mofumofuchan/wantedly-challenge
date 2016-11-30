Rails.application.routes.draw do
  get 'static_pages/home'

  resources :users, :except => [:edit, :update, :destroy]
  get 'signup', to: 'users#new'
end
