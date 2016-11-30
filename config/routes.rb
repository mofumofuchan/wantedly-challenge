Rails.application.routes.draw do
  get 'users/new'
  get 'signup' => 'users#new'
end
