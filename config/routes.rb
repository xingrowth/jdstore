Rails.application.routes.draw do
	mount ChinaCity::Engine => '/china_city'


	  namespace :account do
    resources :orders
  end
	namespace :admin do
	  resources :products
 	end
  devise_for :users
 	root 'products#index'
 	resources :products do
		member do
			post :add_to_cart
		end
	end
	resources :carts do
	 collection do
     delete :clean
		 	post :checkout
   end
 end
 resources :cart_items
 resources :orders
end
