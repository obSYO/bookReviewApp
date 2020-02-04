Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:new, :index, :create, :edit, :update, :destroy] do
      collection do
        get 'search'
      end
    end
  end
  resources :users, only: [:index, :new, :create, :show]
end