Rails.application.routes.draw do
  get 'routines/index'
  devise_for :users
  
  root to: "routines#index"
  resources :routines
  resources :users, only: [:edit, :update]
  resources :my_routines do
    resources :routine_records, only: [:new, :create]
  end
end
