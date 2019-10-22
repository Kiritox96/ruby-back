Rails.application.routes.draw do
  resources :anime, only: [:index]
  resources :user, only: [:index, :show, :create, :destroy, :update]
  	
end
