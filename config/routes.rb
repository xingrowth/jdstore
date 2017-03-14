Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount RuCaptcha::Engine => "/rucaptcha"
  resources :comments
  devise_for :users, :controllers => { :registrations => "users/registrations" ,:passwords => 'users/passwords',:confirmations => 'users/confirmations'}
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#index'

resources :products do
 resources :reviews
  collection do
    get :shop1
    get :shop2
    get :shop3
    get :search
    get :menu1
    get :menu2
    get :menu3
    get :menu0
    get :search_fruit
    get :search_salad
    get :search_nut
  end
  member do
    put "like", to: "products#upvote"
    put "dislike", to: "products#downvote"
    post :collect
    post :discollect
  end
resources :comments
member do
  post :add_to_cart
end
end

namespace :admin do
  resources :products
  resources :orders do
    member do

      post :cancel
      post :ship
      post :shipped
      post :return
    end
  end
end

resources :carts do
  collection do
    delete :clean
    post :checkout
  end
end

resources :orders do
  member do
    post :pay_with_alipay
    post :pay_with_wechat
    post :apply_to_cancel
  end
end


resources :cart_items

namespace :account do
    resources :orders
    resources :collections

end

namespace :admin do
  resources :products do
    member do
      post :move_up
      post :move_down
    end
  end
end

end
