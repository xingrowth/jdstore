Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :welcome

  namespace :admin do
    resources :products
  end
  root "products#index"

  resources :products

  namespace :admin do
    resources :user_mg do
      member do
        post :change_admin

      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts

  resources :carts do
      member do
        post :up
        post :down
        post :up2
        delete :empty_cart
      end
  end

  resources :carts do
    collection do
      post :checkout
    end
  end

  resources :orders

  resources :orders do
    member do
      post :is_paid
      post :change_state
      post :return_good
    end
  end

  namespace :admin do
    resources :order_mg
  end
end
