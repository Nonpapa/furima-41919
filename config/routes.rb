Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get "up" => "rails/health#show", as: :rails_health_check
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
   resources :orders, only: [:index, :create] 
end
