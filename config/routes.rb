Rails.application.routes.draw do
  resources :anime, only: [:index, :show]
  resources :others, only: [:show]
  resources :user, only: [:index, :show, :create, :destroy, :update]
  	
end
