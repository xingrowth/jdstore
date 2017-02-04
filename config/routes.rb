Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root 'welcome#index'

  namespace :admin do
    resources :products
  end

end
