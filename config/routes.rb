Rails.application.routes.draw do
  resources :busies
  devise_for :users
  resources :employees

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
