Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get "up" => "rails/health#show", as: :rails_health_check
  root 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
  end
end