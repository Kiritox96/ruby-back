Rails.application.routes.draw do
  resources :world, only: [:index, :show]
  resources :update, only: [:index]
  resources :manga, only: [:index,:show]
  resources :notifications, only: [:index,:create]
  #add our register route
  post 'auth/register', to: 'users#register'
  post 'auth/login', to: 'users#login'
  get 'test', to: 'users#test'
  delete 'notifications' => 'notifications#destroy'
 # api_guard_routes for: 'users'
end


