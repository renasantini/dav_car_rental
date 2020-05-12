Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  resources :manufacturers
  resources :subsidiaries, only: [:index, :show, :new, :create, :edit, :update]
  resources :car_categories, only: [:index, :show, :new, :create, :edit, :update]
  resources :customers, only: %i[index show new create] do
    get 'search', on: :collection
  end
  resources :car_models, only: [:index, :show, :new, :create]
  resources :rentals, only: %i[index show new create] do
    get 'search', on: :collection
    resources :car_rentals, only: [:new, :create]
  end
end
