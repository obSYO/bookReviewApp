Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books, only: [:index, :new, :create, :edit, :update] do
    resources :posts, only: :create
  end
  resources :users, only: [:index, :new, :create]
end