Rails.application.routes.draw do
  get 'routines/index'
  devise_for :users
  
  root to: "routines#index"
  resources :routines, only: [:index, :new, :create]
  resources :users, only: [:edit, :update]
end
