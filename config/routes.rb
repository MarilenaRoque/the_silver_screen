Rails.application.routes.draw do
  resources :bookmarks, except: [:show, :update, :edit]
  resources :categories
  resources :articles
  devise_for :users
  resources :votes, only: [:create, :new, :destroy, :new]
  root to: "categories#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
