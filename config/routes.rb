Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :products
  end

  root 'products#index' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products

end
