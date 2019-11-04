Rails.application.routes.draw do
  resources :anime, only: [:index, :show]
  resources :others, only: [:index]
  resources :user, only: [:index, :show, :create, :destroy, :update]
  	
end
