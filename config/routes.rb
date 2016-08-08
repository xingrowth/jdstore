Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :stores do
    resources :products
  end
end
