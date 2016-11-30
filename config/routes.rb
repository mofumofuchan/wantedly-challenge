Rails.application.routes.draw do
  resources :users, :except => [:edit, :update, :destroy]
  get 'signup', to: 'users#new'
end
