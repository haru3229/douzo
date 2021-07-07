Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :show]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end