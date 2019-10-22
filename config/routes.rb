Rails.application.routes.draw do
  resources :anime, only: [:index]
  namespace :api do
    resources :user, only: %i[index show create destroy update]
  end	
end
