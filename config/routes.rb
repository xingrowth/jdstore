Rails.application.routes.draw do
root 'products#index'
  namespace :admin do
    resources :products
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
      member do
        post :add_to_cart
      end
    end
resources :carts do
   collection do
     delete :clean
   end
 end
end
