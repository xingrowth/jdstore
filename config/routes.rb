Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	namespace :admin do
		resources :products
	end

	resources :products do
		member do
			post :add_to_cart
			post :remove_from_cart
		end
	end

	resources :carts do
		collection do
			post :clear_cart
		end
	end

	resources :cart_item

	root 'products#index'

end
