Rails.application.routes.draw do
  resources :world, only: [:index, :show]
  resources :update, only: [:index]
  resources :manga, only: [:index,:show]
  resources :notifications, only: [:index,:create]
  delete 'notifications' => 'notifications#destroy'
 # api_guard_routes for: 'users'
end


