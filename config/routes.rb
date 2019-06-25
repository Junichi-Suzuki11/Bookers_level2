Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:welcome, :create, :index, :show, :edit, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  root to: 'books#welcome'
end
