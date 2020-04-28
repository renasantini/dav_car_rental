Rails.application.routes.draw do
  root 'home#index'
  
  resources :manufacturers
  resources :subsidiaries, only: [:index, :show, :new, :create, :edit, :update]
  resources :car_categories, only: [:index, :show, :new, :create]
  resources :customers, only: [:index, :show, :new, :create]
  resources :car_models, only: [:index, :show]
end
