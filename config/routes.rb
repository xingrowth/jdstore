Rails.application.routes.draw do
   namespace :admin do
   resources :products
 end

  devise_for :users

  resources :products do
    member do
      post :add_to_cart
    end
  end

  root 'products#index'

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :orders

  namespace :account do
    resources :orders
  end
end
