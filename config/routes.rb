Rails.application.routes.draw do
  root 'home#index'
  
  resources :manufacturers
  resources :subsidiaries, only: [:index, :show, :new, :create]
  resources :car_categories, only: [:index, :show, :new, :create]
end
