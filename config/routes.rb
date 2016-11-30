Rails.application.routes.draw do
  get 'users/new'
  get 'users/:id', to: 'users#show'
  get 'signup', to: 'users#new'
end
