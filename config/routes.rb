Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :posts, only: [:new, :create]
  resources :books, only: [:new, :create, :edit, :update]
end