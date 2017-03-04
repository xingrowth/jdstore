Rails.application.routes.draw do

  resources :cart_items

  resources :carts do #购物车
    collection do
      delete :clean
      post   :checkout #结账
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :products
  end

  devise_for :users
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
