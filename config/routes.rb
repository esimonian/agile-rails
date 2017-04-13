Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :carts
    resources :line_items
    resources :orders
    resources :products

    root to: "users#index"
  end

  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  resources :products do 
    get :who_bought, on: :member
  end
  
  resources :line_items do
    put 'decrease', on: :member
    put 'increase', on: :member
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
