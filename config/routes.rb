Rails.application.routes.draw do
  namespace :adimn do
    resource :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  
end
