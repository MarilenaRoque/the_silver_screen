Rails.application.routes.draw do
  resources :bookmarks
  resources :categories
  resources :articles
  devise_for :users
  resources :users, only: [:index]
  resources :votes, only: [:create, :new, :destroy]
  root to: "categories#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
