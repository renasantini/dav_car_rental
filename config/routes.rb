Rails.application.routes.draw do
  root 'home#index'
  
  resources :manufacturers, only: [:index, :show, :new, :create]
  resources :subsidiaries, only: [:index, :show]
end
