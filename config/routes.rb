Rails.application.routes.draw do
  resources :anime, only: [:index, :show]
  resources :others, only: [:show]
  resources :users, only: [:index]  
  post '/auth/login', to: 'authentication#login'
end


