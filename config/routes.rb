Rails.application.routes.draw do
  namespace :admin do
   resources :products
  end

  root 'products#index'
  devise_for :users
  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts

end
