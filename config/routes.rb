Rails.application.routes.draw do
  devise_for :users
  resources :coupons
  resources :invoices
  resources :products
  resources :clients

  root to: 'pages#index'
end
