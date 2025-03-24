Rails.application.routes.draw do
  get 'items/index'
  get "up" => "rails/health#show", as: :rails_health_check
  root 'items#index'
end
