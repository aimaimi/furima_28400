Rails.application.routes.draw do
  devise_for :users
  root 'items#index'  
  resources :items, only: [:index,:create,:new]
end
