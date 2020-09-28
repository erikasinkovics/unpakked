Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :stores do
    resources :product_category_tags, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :product_category_tags, only: [:destroy]
  resources :product_categories, only: [:index, :new, :create, :destroy]
  resources :reviews, only: [:destroy]
end
