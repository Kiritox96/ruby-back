Rails.application.routes.draw do
  resources :anime, only: [:index, :show]
  resources :others, only: [:show]
  resources :manga, only: [:index]
  resources :notifications, only: [:index,:create]
  delete 'notifications' => 'notifications#destroy'
  resources :users, only: [:index,:create,:show,:destroy]  
  post '/auth/login', to: 'authentication#login'
end


